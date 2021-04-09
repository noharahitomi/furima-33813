## itemsテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| item_name| string | null: false |
| text     | text   | null: false |
| category | string | null: false |
| status   | string | null: false |
| from     | string | null: false |
| days     | string | null: false |
| price    | string | null: false |

### Association
- belongs_to :user


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

