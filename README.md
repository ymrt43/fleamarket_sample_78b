# README

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|age|int|null: false|

### Association


## identificationsテーブル
|Column|Type|Options|
|------|----|-------|
|familyname|string|null: false|
|firstname|string|null: false|
|familykana|string|null: false|
|firstkana|string|null: false|
|birthdate|date|null: false|

### Association
- belongs_to :user

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postalcode|int|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|block|string|null: false|
|etc|string|null: false|
|dialnumber|date|null: false|

### Association
- belongs_to :user

## cregitcardsテーブル
|Column|Type|Options|
|------|----|-------|
|info|string|null: false|

### Association
- belongs_to :user

