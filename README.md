## itemsテーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| name                | string     | null: false |
| info                | text       | null: false |
| category_id            | integer    | null: false |
| sales_status_id        | integer    | null: false |
| shipping_fee_status_id | integer    | null: false |
| prefecture_id          | integer    | null: false |
| scheduled_delivery_id  | integer    | null: false |
| price               | integer       | null: false |
| user                     | references    | foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase


## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false, unique: true |
| encrypted_password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :items
- has_many :purchases


## purchasesテーブル
| Column           | Type       | Options            |
| ---------------- | ---------- | ------------------ |
| user             | references | foreign_key: true  |
| item             | references | foreign_key: true  |


### Association
- has_one :item
- belongs_to :user
- has_one :addressee



## addresseesテーブル

| Column           | Type       | Options            |
| ---------------- | ---------- | ------------------ |
| post_code        | string     | null: false        |
| prefecture_id    | integer    | null: false        |
| municipalities   | string     | null: false        |
| address          | string     | null: false        |
| building_name    | string     | null: false        |
| tel_number       | string     | null: false        |

### Association
belongs_to :purchase
