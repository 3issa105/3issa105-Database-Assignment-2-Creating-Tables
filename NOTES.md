# BidNile Database Notes

## 1. The 4 Schemas, Their Tables, and Why

- **`Accounts`** (`Member`, `Wallet`): Holds user identity, contact details, verification data, referral links, and each member's wallet balance/holds.
- **`Logistics`** (`City`, `Warehouse`, `Employee`): Covers physical operations—supported cities, warehouse locations/capacities, and staff/manager assignments.
- **`Catalogue`** (`Category`, `Item`, `ItemPhoto`): Holds the merchandising category tree, listed items with JSON specifications and inspection info, and item photos.
- **`Sales`** (`Auction`, `Bid`, `AuctionFollower`): Manages timed auctions, incoming bids, and auction followers (`AuctionFollower` is later transferred to `Marketing` in task 3.12).

---

## 2. Relationship Types in BidNile

- **1:1 (One-to-One):**
  - `Accounts.Member` and `Accounts.Wallet`: `Wallet.MemberId` is both the primary key and a foreign key (`FK_Wallet_Member`) referencing `Member.MemberId`, guaranteeing one wallet per member.
  - `Accounts.Member` and `Logistics.Employee`: `Employee.MemberId` is both PK and FK (`FK_Employee_Member`) referencing `Member.MemberId` (only some members are employees).
  - `Logistics.Warehouse` and `Logistics.Employee` (management): `Warehouse.ManagerId` has `UQ_Warehouse_ManagerId` and references `Employee.MemberId` (`FK_Warehouse_Employee`), so each warehouse has one manager and an employee manages one warehouse at most.
- **1:N (One-to-Many):**
  - `City` to `Member`, `City` to `Warehouse`, `Category` to `Item`, `Member` (seller) to `Item`, `Warehouse` to `Item`, `Employee` (inspector) to `Item`, `Item` to `Auction`, `Auction` to `Bid`, and `Member` to `Bid`. Mapped by placing the parent's PK as a foreign key column in the child (`N`) table.
- **M:N (Many-to-Many):**
  - `Accounts.Member` and `Sales.Auction` via `Sales.AuctionFollower` (later `Marketing.AuctionFollower`), mapped as a bridge table with composite PK `(MemberId, AuctionId)`, FKs to both tables, and `FollowedAt`.
- **Recursive (Self-Referencing):**
  - `Accounts.Member.InvitedByMemberId` references `Accounts.Member.MemberId` (`FK_Member_Member`) to track referrals, with `CK_Member_InvitedByMemberId` preventing self-invitations.
  - `Catalogue.Category.ParentCategoryId` references `Catalogue.Category.CategoryId` (`FK_Category_Category`) to form the category tree, with `CK_Category_ParentCategoryId` preventing self-parenting.
- **Circular:**
  - `Logistics.Warehouse` and `Logistics.Employee`: every employee works in one warehouse (`Employee.WarehouseId -> Warehouse.WarehouseId`), and every warehouse is managed by one employee (`Warehouse.ManagerId -> Employee.MemberId`).
- **Weak Entity:**
  - `Catalogue.ItemPhoto`: cannot exist without a parent `Catalogue.Item`. Mapped with composite PK `(ItemId, Position)` where `Position` (`1..20`) is the partial key, and `FK_ItemPhoto_Item` uses `ON DELETE CASCADE` so photos disappear when their item is deleted.

---

## 3. Data Type Choices

- **Why `UNIQUEIDENTIFIER` (GUID) for members:** Mobile clients generate `MemberId` locally before the sign-up request reaches the server, so sequential `IDENTITY` numbers would collide across devices. `UNIQUEIDENTIFIER` with `DEFAULT (NEWID())` allows client-generated IDs while letting the server fall back when needed.
- **Why `BIGINT` for bids:** A standard 32-bit `INT` maxes out at `2,147,483,647`. With hundreds of millions of bids per year, the counter will exceed `2.1` billion within a few years, so `BIGINT IDENTITY(1,1)` prevents identity overflow.
- **Why `FLOAT` for GPS vs `DECIMAL` for money:** Map latitude/longitude values are approximate continuous readings with many decimal places, where binary floating-point (`FLOAT`) is compact and accurate enough. Money values (`Balance`, `HeldAmount`, `StartingPrice`, `Amount`, `CommissionPct`) require exact base-10 arithmetic without binary rounding errors, so fixed-point `DECIMAL(12, 2)` and `DECIMAL(4, 2)` are used.
- **Why `DATETIMEOFFSET` for auctions:** Members bid from Cairo (`+02:00`), Riyadh (`+03:00`), and Dubai (`+04:00`). Storing the UTC offset alongside `StartTime` and `EndTime` preserves the exact regional timestamp and keeps `EndTime > StartTime` accurate across time zones.

---

## 4. Why the Circular Relationship Cannot Be Created Inside `CREATE TABLE`

`Logistics.Warehouse` has a foreign key (`ManagerId`) referencing `Logistics.Employee`, while `Logistics.Employee` has a foreign key (`WarehouseId`) referencing `Logistics.Warehouse`. Whichever table is written first in `CREATE TABLE` cannot declare a foreign key pointing to the second table because that second table does not exist yet. Creating both tables first without FK constraints and adding the foreign keys afterward in `ALTER TABLE` (Task 3.1) breaks the dependency cycle.

---

## 5. Table Population Order and Why

Because foreign keys are active during Task 4, parent rows must exist before child rows:

1. `Logistics.City` (no outgoing FKs).
2. `Catalogue.Category` (insert root categories with `ParentCategoryId = NULL` first, then child categories).
3. `Accounts.Member` (depends on `City`; insert uninvited members first, then members referencing an earlier inviter in `InvitedByMemberId`).
4. `Accounts.Wallet` (1:1 FK to `Member`).
5. `Logistics.Warehouse` and `Logistics.Employee` (one warehouse at a time to satisfy both circular FKs and `UQ_Warehouse_ManagerId`: insert one `Warehouse` with `ManagerId = NULL` and `ManagerStartDate = NULL`, insert its `Employee` row(s), then `UPDATE` that warehouse's `ManagerId` and `ManagerStartDate` before creating the next warehouse).
6. `Catalogue.Item` (depends on `Member` seller, `Category`, `Warehouse`, and `Employee` inspector).
7. `Catalogue.ItemPhoto` (weak entity depending on `Item`).
8. `Sales.Auction` (depends on `Item`).
9. `Sales.Bid` (depends on `Auction` and `Member`).
10. `Marketing.AuctionFollower` (depends on `Member` and `Auction`).

---

## 6. Errors in 3.6 and 3.11 and How They Were Fixed

- **Task 3.6 (`MaxItems` to `SMALLINT`):** Running `ALTER TABLE Logistics.Warehouse ALTER COLUMN MaxItems SMALLINT NOT NULL` fails with SQL Server `Msg 5074` because a `CHECK` constraint depends on the column (`CK_Warehouse_Capacity` originally blocked `sp_rename` in 3.4 with `Msg 15336`, so it was dropped, renamed, and re-added as `CK_Warehouse_MaxItems`). To resize the column, I dropped `CK_Warehouse_MaxItems`, altered `MaxItems` to `SMALLINT NOT NULL`, and re-added `CONSTRAINT CK_Warehouse_MaxItems CHECK (MaxItems > 0)`.
- **Task 3.11 (Dropping `IsVerified`):** Running `ALTER TABLE Accounts.Member DROP COLUMN IsVerified` fails with `Msg 5074` because the default constraint `DF_Member_IsVerified` is attached to it. I added `VerifiedAt DATETIME2(3) NULL`, dropped `DF_Member_IsVerified` first via `ALTER TABLE ... DROP CONSTRAINT`, and then dropped the `IsVerified` column.

---

## 7. Hand Trace for Task 5 (`nums = [1, 2, 3, 4]`)

- `prefix[i]` stores the product of all elements strictly before index `i` (`prefix[0] = 1`).
- `suffix[i]` stores the product of all elements strictly after index `i` (`suffix[n - 1] = 1`).
- `answer[i] = prefix[i] * suffix[i]`.

| Index `i` | `nums[i]` | `prefix[i]` | `suffix[i]` | `answer[i]` |
| :---: | :---: | :---: | :---: | :---: |
| `0` | `1` | `1` | `24` (`2 * 3 * 4`) | `24` |
| `1` | `2` | `1` (`1`) | `12` (`3 * 4`) | `12` |
| `2` | `3` | `2` (`1 * 2`) | `4` (`4`) | `8` |
| `3` | `4` | `6` (`1 * 2 * 3`) | `1` | `6` |

Final result: `[24, 12, 8, 6]`.
