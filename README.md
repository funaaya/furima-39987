# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname	string¥null: false	            |
|family_name	string	null: false           |
|fairst_name	string	null: false           |
|family_name_kana	string	null: false       |
|first_name	string	null: false             |
|birth_year	string	null: false             |
|birth_month	string	null: false           |
|birth_day	string	null: false             |
|password	string	null: false               |
|email	string	null: false, unique: true   |
|status	integer	null: false                 |
|eleted_at	datetime	null: false           |

## social_providers テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user_id	references	null: false, FK: true|
| provider	string	null :false            |

## deliver_adresses テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user_id	references	null: false, FK: true            |
|family_name	string	null: false                      |
|first_name	string	null: false                        |
|family_name_kana	string	null: false                  |
|first_name_kana	string	null: false                  |
|zip_code	integer	null: false                          |
|prefecture	string	null: false                        |
|city	string	null: false                              |
|adress1	string	null: false                          |
|adress2	string	                                     |
|telephone	string	unique: true                       |

## wallets テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id	references	null: false, FK: true             |
| money	integer	null: false                             |

## points テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id	rederences	null: false, FK: true             |
| score	imteger	null: false                             |

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id	references	null: false, FK: true             |
|item_id	references	null: false, FK: true             |
|text	text	null: false  

  ## likes テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id	references	null:false, FK: true              |
|item_id	references	null:false, FK: true              |

 ## reviews テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id	references	null: false, FK: true             |
|item_id	references	null: false, FK:true              |
|rate	integer	null: false                               |
|text	text 

  ## oders テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buyer_user_id	references	null: false, FK: true       |
| item_id	references	null: false, FK: true             |    

 ## items テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| category_id	references	null: false, FK: true         |
| shipping_id	references	null: false. FK: true         |
| brand_id	references	null: false. FK: true           |
| seller_user_id	references	null: false, FK: true     |
| name	string	null: false                             |   
| text	text	null: false                               |
| condition	integer	null: false                         |
| price	integer	null: false                             |
| trading_status	integer	null: false                   |
| completed_at	datetime	                              |

## item_images テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_id	references	null: false, FK: true             |
| image_url	string	null: false                         |

## categories テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| path	text	null: false                               |
| name	string	null: false                             |
| ancestry	string                                      |

## sizes テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| path	text	null: false                               |
| kind	string	null: false                             |
| ancestry	string                                      |

## category_sizes テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| category_id	references	FK: ture                      |
| size_id	references	FK: true                          |

## brands テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| category_id	references	null: false, FK: true         |
| brand_id	references	null: false, FK: true           |
| name	string	null: false                             |

## brand-groups テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name	string	null: false                             |

## shippings テーブル         
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| fee_burden	boolean	null: false                       |
| service	integer	null: false                           |
| area	integer	null: false                             |
| handling_time	integer	null: false                     |



                                    