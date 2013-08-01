require 'json'
require 'mysql2'
require 'yaml'
order_object = [
  {
    "orderid" => 123,
    "customer_id" => 1,
    "order_products" => [
      {
        "product_id" => 1,
        "product_description" => "Cocaine",
        "product_price" => 30,
        "quantity" => 1
      },
      {
        "product_id" => 2,
        "product_description" => "Meth",
        "product_price" => 20,
        "quantity" => 1
      }
    ]
  },
  {
    "orderid" => 124,
    "customer_id" => 3,
    "order_products" => [
      {
        "product_id" => 1,
        "product_description" => "Cocaine",
        "product_price" => 30,
        "quantity" => 1
      },
      {
        "product_id" => 4,
        "product_description" => "Heroin",
        "product_price" => 25.5,
        "quantity" => 1
      },
      {
        "product_id" => 3,
        "product_description" => "Marijuana",
        "product_price" => 10.5,
        "quantity" => 1
      }
    ]
  },
  {
    "orderid" => 125,
    "customer_id" => 2,
    "order_products" => [
      {
        "product_id" => 5,
        "product_description" => "Salvia",
        "product_price" => 2.5,
        "quantity" => 1
      }
    ]
  },

  {
    "orderid" => 126,
    "customer_id" => 1,
    "order_products" => [
      {
        "product_id" => 3,
        "product_description" => "Marijuana",
        "product_price" => 10.50,
        "quantity" => 1
      },
      {
        "product_id" => 2,
        "product_description" => "Meth",
        "product_price" => 20,
        "quantity" => 1
      }
    ]
  }  
]
config = YAML::load(open("#{File.expand_path(File.dirname(__FILE__))}/configs/configs.yml"))["mysql"]
client = Mysql2::Client.new(:host => config["host"], :username => config["username"], :database => config["database"])
client.query "Truncate table Order_products"
client.query "Truncate table Orders"

order_object.each{ |order|
  @order_total = 0
  orderid = order["orderid"]
  customer_id = order["customer_id"]
  date_placed = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  
  order["order_products"].each{ |product|
    product_id = product["product_id"]
    quantity = product["quantity"]
    @order_total = @order_total + product["product_price"]
    client.query "Insert into Order_products(orderid,product_id,quantity) values('#{orderid}','#{product_id}', '#{quantity}')"
  }
  client.query "Insert into Orders values ('#{orderid}', '#{customer_id}', '#{date_placed}', '#{@order_total}')"
}

# puts order_object.to_json