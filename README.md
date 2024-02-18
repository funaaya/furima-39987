# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname	         | string |null: false	               |           
| family_name      	 | string	|null: false                 |
| first_name	       | string |null: false                 |
| family_name_kana	 | string	|null: false                 |
| first_name_kana	   | string |null: false                 |
| birth_day	         | date 	|null: false                 |
| password           | string	|null: false                 |       
| email	             | string	|null: false, unique: true   |

## social_providers テーブル

| Column | Type      | Options             |
| ------ | --------- | ------------------- |
|user_id |references |null: false, FK: true|
|provider|string     |null :false          |

## deliver_adresses テーブル

| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| user_id          |integer     |null: false, FK: true        |
| family_name      |string	    |null: false                   |
| first_name       |string	    |null: false                   |
| family_name_kana |string	    |null: false                   |
| first_name_kana  |string	    |null: false                   |
| post_code	       |string      |null: false                   |
| prefecture	     |string	    |null: false                   |
| city	           |string	    |null: false                   |
| address          |string	    |null: false                   |
| phone_number     |string	    |null: false                   |
| building_name    |string      |null: false                   |

## wallets テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id	|references  |null: false, FK: true           |
| money	  |integer	   |null: false                     |

## points テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id	|references  |null: false, FK: true           |
| score	  |integer	   |null: false                     |

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|user_id  |references  |null: false, FK: true           |
|item_id	|references	 |null: false, FK: true           |
|text	    |text        |null: false                     |

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|user_id  |references  |null: false, FK: true           |
|item_id	|references	 |null: false, FK: true           |
|text	    |text        |null: false                     |


  ## likes テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|user_id	|references  |null:false, FK: true            |
|item_id	|references	 |null:false, FK: true            |

 ## reviews テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
|user_id |	references |	null: false, FK: true         |
|item_id  |	references |	null: false, FK:true          |
|rate     |	integer    | 	null: false                   |
|text     |	text       |

  ## orders テーブル         
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| buyer_user_id|references  |	null: false, FK: true          |
| item_id	     |references  |	null: false, FK: true          |            

 ## items テーブル         
| Column        | Type       | Options                        |
| -------       | ---------- | ------------------------------ |
| category_id   |integer  	 |null: false, FK: true           |
| shipping_id   |string   	 |null: false. FK: true           |
| brand_id      |integer     |null: false. FK: true           |
| user_id       |integer     |null: false, FK: true           |
| name	        |string	     |null: false                     |   
| description	  |string      |null: false                     |
| judgment      |string      |null: false                     |
| price	        |string      |null: false                     |
| status        |string      |null: false                     |
| shipping_cost |string 	   |null: false                     |
| shipping_days |string      |null: false                     |

## categories テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| path	  |text	       |null: false                     |
| name	  |string      |null: false                     |
| ancestry|string      |null: false                     |

## sizes テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| path	  |text	       |null: false                     |
| kind	  |string      |null: false                     |
| ancestry|string      |null: false                     |

## category_sizes テーブル         
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| category_id|references	|FK: ture                        |
| size_id    |references  |FK: true                        |

## brands テーブル         
| Column      | Type       | Options                        |
| ----------  | ---------- | ------------------------------ |
| category_id	|references  |null: false, FK: true           |
| brand_id    |references  |null: false, FK: true           |
| name	      |string	     |null: false                     |

## brand-groups テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    |	string	   |null: false                     |

## shippings テーブル         
| Column       | Type       | Options                        |
| -----------  | ---------- | ------------------------------ |
| fee_burden   |boolean	    |null: false                     |
| service	     |integer	    |null: false                     |
| area	       |integer	    |null: false                     |
| handling_time|integer     |null: false                     |



                                    