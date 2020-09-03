Ecommerse
========
[![Build Status](https://travis-ci.org/thuehlinger/daemons.svg?branch=master)](https://travis-ci.org/thuehlinger/daemons)

The application is to create a checkout system/cart that confirms the following discount/promotion rule interface.

```ruby
Pseudo Code:
co = Checkout.new(product_ids)
co.compute
price = co.total
discount = co.discount
```

|Item|Price|
|A|30|
|B|20|
|C|50|
|D|15|

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
