#テーブル設計

## Usersテーブル

| column             | type   | option                    |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association

-has_many :items
-has_many :purchases

## itemsテーブル

| column             | type       | option                          |
| ------------------ | ---------- | ------------------------------- |
| name               | string     | null: false                     |
| content            | text       | null: false                     |
| category_id        | integer    | null: false                     |
| condition_id       | integer    | null: false                     |
| delivery_charge_id | integer    | null: false                     |
| sender_id          | integer    | null: false                     |
| delivery_day_id    | integer    | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false , foreign_key: true |

### Association

-belongs_to :user
-has_one: purchase


## Purchasesテーブル

| column | type       | option                          |
| ------ | ---------- | ------------------------------- |
| item   | references | null: false , foreign_key: true |
| user   | references | null: false , foreign_key: true |


### Association

-belongs_to :user
-belongs_to :item
-has_one :order

## Ordersテーブル

| column          | type       | option                         |
| --------------- | ---------- | ------------------------------ |
| post_code       | string     | null: false                    |
| sender_id       | integer    | null: false                    |
| town            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_number | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association

-belongs_to :purchase