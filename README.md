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

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| image              | string  | null: false |
| name               | string  | null: false |
| text               | text    | null: false |
| price              | integer | null: false |
| user_id            | integer | null: false |

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase


## comments テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| text    | text    | null: false |
| user_id | integer | null: false |
| item_id | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item


## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id | references | null: false, foreign_key: true |


### Association

- has_one :receiver
- has_one :card
- belongs_to :item

## receivers テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postcode     | integer    | null: false                    |
| prefecture   | string     | null: false                    |
| city         | text       | null: false                    |
| block        | string     | null: false                    |
| building     | string     | null: false                    |
| phone_number | integer    | null: false                    |
| purchase_id  | references | null: false, foreign_key: true |


### Association

- belongs_to :purchase

## cards テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| card_number   | integer    | null: false                    |
| exp_month     | date       | null: false                    |
| exp_year      | date       | null: false                    |
| security_code | integer    | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |



### Association

- belongs_to purchase
