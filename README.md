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
- has_many :items

## identificationsテーブル
|Column|Type|Options|
|------|----|-------|
|familyname|string|null: false|
|firstname|string|null: false|
|familykana|string|null: false|
|firstkana|string|null: false|
|birthdate|date|null: false|
|user_id|integer|null: false, foreign_key: true|

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
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## cregitcardsテーブル
|Column|Type|Options|
|------|----|-------|
|info|string|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false, foreign_key: true|
|brand|string||
|state|int|null: false|
|fee|int|null: false|
|area|int|null: false|
|term|int|null: false|
|price|int|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :images
- belongs_to :user
- belongs_to :category

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|parent_id|integer|null: false, foreign_key: true|

### Association
- has_many :items
- belongs_to :parent, class_name: :category
- has_many :children, class_name: :category, foreign_key: parent_id
