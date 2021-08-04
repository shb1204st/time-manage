# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| kana_name          | string | null: false               |
| department         | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### association

has_many :times
has_many :comments

## times テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| time_id     | integer    | null: false                    |
| content_id  | integer    | null: false                    |
| detail      | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### association

belongs_to :user
has_many   :comments

## comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       |                   |
| user    | references | foreign_key: true |
| room    | references | foreign_key: true |

### association

belongs_to :user
belongs_to :time