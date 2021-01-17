# テーブル設計

## users テーブル
| Column     | Type   | Options                   |
| ---------- | ------ | ------------------------- |
| nickname   | string | null: false               |
| email      | string | null: false, unique: true |
| password   | string | null: false               |
| profile    | text   | null: false               |
| birth_date | date   | null: false               |

### Association
- has_many :books
- has_many :words
- has_many :comments

## books テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| genre_id | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :words
- has_many :comments

## words テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| name   | string     | null: false                    |
| info   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| book   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :book

## comments テーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| book    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :book