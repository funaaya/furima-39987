# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname	         | string |null: false                 |           
| last_name       	 | string	|null: false                 |
| first_name	       | string |null: false                 |
| last_name_kana	   | string	|null: false                 |
| first_name_kana	   | string |null: false                 |
| birthday	         | date 	|null: false                 |
| encrypted_password | string	|null: false                 |       
| email	             | string	|null: false, unique: true   |

### Association
- has_many :items
-has_many :orders
-has_many :comments


## payments テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| postcode	       |string      |null: false                   |
| prefecture_id	   |integer	    |null: false                   |
| city	           |string	    |null: false                   |
| phone_number     |string	    |null: false                   |
| building         |string      |                              |
| order            |references  |null: false, foreign_key: true|
| block            |string      |null: false                   |

### Association
- belongs_to :order

  ## orders テーブル         
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         |references  |	null: false, FK: true          |
| item  	     |references  |	null: false, FK: true          |      

### Association
- belongs_to :user
-belongs_to :item
-has_one :payment

 ## items テーブル         
| Column           | Type       | Options                        |
| -------          | ---------- | ------------------------------ |
| category_id      |integer  	  |null: false                     |
| user             |references  |null: false, FK: true           |
| name	           |string	    |null: false                     |   
| description	     |text        |null: false                     |
| prefecture_id    |integer     |null: false                     |
| price	           |integer     |null: false                     |
| item_status_id   |integer     |null: false                     |
| shipping_cost_id |integer     |null: false                     |
| shipping_date_id |integer     |null: false                     |

### Association
- belongs_to :user
-has_one :order
-has_many :comments

                                    