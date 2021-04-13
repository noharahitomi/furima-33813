## itemsテーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| item_name                | string     | null: false |
| item_info                | text       | null: false |
| item_category            | string     | null: false |
| item_sales_status        | string     | null: false |
| item_shipping_fee_status | string     | null: false |
| item_prefecture          | string     | null: false |
| item_scheduled_delivery  | string     | null: false |
| item_price               | string     | null: false |
| user                     | references | foreign_key: true |


### Association
- belongs_to :user
- has_one :items


## usersテーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :items


## buyersテーブル
| Column           | Type       | Options            |
| ---------------- | ---------- | ------------------ |
| user             | references | foreign_key: true  |
| item             | references | foreign_key: true  |
| post_code        | string     | null: false        |
| prefecture       | text       | null: false        |
| municipalities   | text       | null: false        |
| address          | text       | null: false        |


### Association
- belongs_to :item
- belongs_to :user