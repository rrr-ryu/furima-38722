#テーブル設計

## Userテーブル

| column          | type   | option                    |
| --------------- | ------ | ------------------------- |
| nickname        | string | null: false               |
| email           | string | null: false               |
| password        | string | null: false, unique: true |
| last_name       | string | null: false               |
| first_name      | string | null: false               |
| first_name_kana | string | null: false               |
| last_name_kana  | string | null: false               |
| birthday        | date   | null: false               |

### Association

-has_many :items
-has_many :purchases

## itemテーブル

| column          | type       | option                          |
| --------------- | ---------- | ------------------------------- |
| name            | string     | null: false                     |
| content         | text       | null: false                     |
| category        | string     | null: false                     |
| condition       | string     | null: false                     |
| delivery_charge | string     | null: false                     |
| sender          | string     | null: false                     |
| price           | integer    | null: false                     |
| user_id         | references | null: false , foreign_key: true |

### Association

-belongs_to :user
-has_one: purchase


## Purchaseテーブル

| column  | type       | option                          |
| ------- | ---------- | ------------------------------- |
| item_id | references | null: false , foreign_key: true |
| user_id | references | null: false , foreign_key: true |


### Association

-belongs_to :user
-belongs_to: item
-has_one :order

## Orderテーブル

| column          | type       | option                         |
| --------------- | ---------- | ------------------------------ |
| post_code       | integer    | null: false                    |
| prefecture      | string     | null: false                    |
| town            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_number | string     | null: false                    |
| phone_number    | integer    | null: false                    |
| purchase_id     | references | null: false, foreign_key: true |

### Association

-belongs_to :purchase