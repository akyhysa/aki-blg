# AKI BLG DB設計
## reportsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string||
|description|text||
|image|string||
|user_id|integer||
### Association
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string||
|email|string||
|password|string||
|admin|boolean||
### Association
- has_many :reports

