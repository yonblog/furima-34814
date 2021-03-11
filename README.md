# テーブル設計

## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birthday            | date    | null: false |

### Association

- has_many :items
- has_one  :personalinformation
- has_many :comments



## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| product_name        | text       | null: false                    |
| product_description | text       | null: false                    |
| category            | string     | null: false                    |
| product_condition   | string     | null: false                    |
| delivery_fee        | string     | null: false                    |
| delivery_area       | string     | null: false                    |
| delivery_days       | string     | null: false                    |
| price               | integer    | null: false                    |
| user_id             | references | null: false, foreign_key: true |
※ 商品画像はActiveStorageを用いて実装します。

### Association

- belongs_to :user
- has_many :comments



## personalinformations テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | integer    | null: false                    |
| expiration_date | integer    | null: false                    |
| security_code   | integer    | null: false                    |
| postal_code     | integer    | null: false                    |
| prefectures     | string     | null: false                    |
| municipality    | string     | null: false                    |
| address         | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user



## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item