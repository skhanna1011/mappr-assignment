# README

Clone this repo and run the project locally using command 'git clone https://github.com/skhanna1011/mappr-assignment.git'

This project uses Ruby version '2.5.1'. Please refer offical Ruby Docs at 'https://www.ruby-lang.org/en/' and upgrade accordingly.

This project usue Rails version '5.2.2'

Go to the project repo(directory).


if you don't have bundler installed run 'gem install bundler'
run 'bundle install'
run 'rake db:migrate'
run 'rails s' to start rails server and follow instruction to run the project.
Use 'POST /api/v1/products, to populate data.
  Note:-Products can only be created using the post request.
Sample body :-
{
  "expire_date": "2016-09-05",
  "name": "Black Jacket",
  "sku_id": 1234,
  "categories": [
    "jackets",
    "mens-wear"
  ],
  "tags": [
    "black",
    "jacket",
    "leather"
  ],
  "images": [
    {
      "img_path": "http://xxx.png"
    },
    {
      "img_path": "http://yyy.png"
    }
  ],
  "price": 1000
}

GET '/api/v1/products' Responds with JSON to all the products in the database.
GET '/api/v1/products/product_id' Responds with JSON to all the product with id product_id. 
  Note:- id and sku_id are seprate.
PATCH '/api/v1/products/product_id' Updates the product with params passed in body.
DELETE '/api/v1/products/product_id' Deletes the product from the database

In your browser go to '/admin/products' to see all the products
Click on the product name to go to edit page of the product alternatively you can go to '/admin/products/product_id/edit'

For any other queries feel free to contact me.