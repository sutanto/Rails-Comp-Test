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

successful = { cus1.id => 5, cus2.id => 3, cus3.id => 1, cus4.id => 1 }
successful.each do |cus_id, num|
  cus = Customer.find(cus_id)
  num.times {
    Charge.create!(paid: true, amount: 4900, currency: 'usd',
      refunded: false, customer_id: cus.id, disputed: false)
  }
end

failed = { cus3.id => 3, cus4.id => 2 }
failed.each do |cus_id, num|
  cus = Customer.find(cus_id)
  num.times {
    Charge.create!(paid: false, amount: 4900, currency: 'usd',
      refunded: false, customer_id: cus.id, disputed: false)
  }
end

disputed = { cus1.id => 3, cus2.id => 2 }
disputed.each do |cus_id, num|
  cus = Customer.find(cus_id)
  num.times {
    Charge.create!(paid: true, amount: 4900, currency: 'usd',
      refunded: false, customer_id: cus.id, disputed: true)
  }
end
