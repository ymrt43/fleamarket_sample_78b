# README

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string|null: false, unique:true|
|password|string|null: false|

### Association
- has_one :profile
- has_one :address
- has_one :card
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :sell_items, -> { where("buyer_id is NULL") }, foreign_key: "seller_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id", class_name: "Item"


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
- belongs_to :user, optional: true

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postalcode|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_number|string|null: false|
|dial_number|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|prefecture_id|string|null: false|

### Association
- belongs_to :user, optional: true
- belongs_to_active_hash :prefecture

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, limit: 40, index: true|
|description|text|null: false|
|brand|string||
|state|integer|null: false|
|fee|integer|null: false|
|prefecture_id|integer|null: false|
|term|integer|null: false|
|price|integer|null: false|
|seller_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|

### Association
- has_many :images
- belongs_to :seller, class_name: user, foreign_key: "seller_id"
- belongs_to :buyer, class_name: user, optional: true, foreign_key: "buyer_id"
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
