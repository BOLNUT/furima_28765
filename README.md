# テーブル設計


## users テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| nick_name        | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_one :purchase


## items テーブル

| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| image              | string  | null: false                    |
| name               | string  | null: false                    |
| text               | text    | null: false                    |
| price              | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase


## comments テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| text    | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


## purchases テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| item_id | integer | null: false, foreign_key: true |
| user_id | integer | null: false, foreign_key: true |

### Association

- has_one :receiver
- belongs_to :item
- belongs_to :user

## receivers テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| postcode     | string  | null: false                    |
| city         | text    | null: false                    |
| block        | string  | null: false                    |
| building     | string  |                                |
| phone_number | string  | null: false                    |
| purchase_id  | integer | null: false, foreign_key: true |


### Association

- belongs_to :purchase


