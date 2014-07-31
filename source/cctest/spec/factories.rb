FactoryGirl.define do
  factory :customer do
    sequence(:first_name) {|n| "Customer #{n}" }
  end

  factory :charge do
    paid true
    amount 4900
    currency 'usd'
    refunded false
    association :customer
    disputed false

    factory :failed_charge do
      paid false
    end

    factory :disputed_charge do
      disputed true
    end
  end
end
