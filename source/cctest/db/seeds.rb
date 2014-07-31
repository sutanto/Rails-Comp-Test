# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cus1 = Customer.create!(first_name: 'Johny', last_name: 'Flow')
cus2 = Customer.create!(first_name: 'Raj', last_name: 'Jamnis')
cus3 = Customer.create!(first_name: 'Andrew', last_name: 'Chung')
cus4 = Customer.create!(first_name: 'Mike', last_name: 'Smith')

successful = { 5 => cus1, 3 => cus2, 1 => cus3, 1 => cus4 }
successful.each do |num, cus|
  num.times {
    Charge.create!(paid: true, amount: 4900, currency: 'usd',
      refunded: false, customer_id: cus1.id, disputed: false)
  }
end

failed = { 3 => cus3, 2 => cus4 }
failed.each do |num, cus|
  num.times {
    Charge.create!(paid: false, amount: 4900, currency: 'usd',
      refunded: false, customer_id: cus1.id, disputed: false)
  }
end

disputed = { 3 => cus1, 2 => cus2 }
disputed.each do |num, cus|
  num.times {
    Charge.create!(paid: true, amount: 4900, currency: 'usd',
      refunded: false, customer_id: cus1.id, disputed: true)
  }
end
