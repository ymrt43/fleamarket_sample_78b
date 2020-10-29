# README

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|age|integer|null: false|

### Association
- has_one :profile
- has_one :address
- has_many :creditcards
- has_many :comments
- has_many :items


## profilesテーブル
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
|postalcode|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|dial_number|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user

## creditcardsテーブル
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
|state|integer|null: false|
|fee|integer|null: false|
|prefecture|integer|null: false|
|term|integer|null: false|
|price|integer|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|optional: true, foreign_key: true|

### Association
- has_many :images
- has_many :comments
- belongs_to :seller, class_name: user
- belongs_to :buyer, class_name: user
- belongs_to :category
- belongs_to_active_hash :prefecture

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||

### Association
- has_many :items
- has_ancestry

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
