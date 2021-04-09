## itemsテーブル

| Column   | Type   | Options                        |
| -------- | ------ | ------------------------------ |
| item_name| string | null: false, foreign_key: true |
| text     | text   | null: false, foreign_key: true |
| category | string | null: false, foreign_key: true |
| status   | string | null: false, foreign_key: true |
| from     | string | null: false, foreign_key: true |
| days     | string | null: false, foreign_key: true |
| price    | string | null: false, foreign_key: true |

### Association
- belongs_to :user