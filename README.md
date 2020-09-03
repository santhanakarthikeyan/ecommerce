Ecommerse
========
[![Build Status](https://travis-ci.org/thuehlinger/daemons.svg?branch=master)](https://travis-ci.org/thuehlinger/daemons)

This application is to create a checkout system/cart that confirms the following discount/promotion rule interface.

```ruby
Pseudo Code:
co = Checkout.new(product_ids)
co.compute
price = co.total
discount = co.discount
```
#### Product Items

|Item|Price|
|----|----:|
|A.  |30.  |
|B   |20.  |
|C.  |50   |
|D   |15.  |

#### Promotions
* If 3 of Item A is purchased, the price of all three is Rs 75(i.e multiples of 3 discount)
* If 2 of Item B is purchased, the price of both is Rs 35(i.e multiples of 2 discount)
* If the total basket price(after previous discounts) is over Rs 150, the basket receives an
additional discount of Rs 20.

#### Example Test Data
|Basket              |Price|
|--------------------|----:|
|A, B, C             |100. |
|B, A, B, A, A       | 110 |
|C, B, A, A, D, A, B | 155 |
|C, A, D, A , A      | 140 |

#### URL
```
https://localhost:3000
```

#### APIs supported
Add to Cart
```
POST https://localhost:3000/products/1/add_to_cart
```

Checkout
```
GET https://localhost:3000/products/checkout
```

Refer below instruction incase if you not sure about how to start rails server

#### Ruby version
```ruby
2.6.3
```

#### System dependencies
* rvm
* SqlLite

#### Installation
```ruby
rvm install 2.6.3
bundle install

rake db:create
rake db:migrate
rake db:seed
```

#### How to run test case
```ruby
rake test
```

#### How to start rails server
```ruby
rails s
```
