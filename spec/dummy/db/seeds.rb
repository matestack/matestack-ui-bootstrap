# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Admin.count == 0
  Admin.create(email: "admin@matestack.io", password: "password")
end

Product.destroy_all
Customer.destroy_all
Order.destroy_all
OrderItem.destroy_all

100.times do
  Customer.create(
    created_at: Faker::Date.between(from: 50.days.ago, to: Date.today),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    street: Faker::Address.street_name,
    house_number: Faker::Address.building_number,
    postal_code: Faker::Address.postcode,
    city: Faker::Address.city
  )
end

50.times do
  Product.create(
    name: Faker::Commerce.product_name,
    description: "High quality product made with #{Faker::Commerce.material}",
    price_in_euro: Faker::Commerce.price,
  )
end

75.times do
  random_customer = Customer.order(Arel.sql('RANDOM()')).first
  ordered_at = Faker::Date.between(from: 50.days.ago, to: Date.today)

  order = Order.create(
    created_at: ordered_at,
    customer: random_customer,
    shipped_at: ordered_at + 2.days
  )

  rand(1..5).times do
    random_product = Product.order(Arel.sql('RANDOM()')).first
    order_item = OrderItem.create(
      created_at: ordered_at,
      product: random_product,
      order: order,
      price_in_euro: random_product.price_in_euro,
    )
  end

end
