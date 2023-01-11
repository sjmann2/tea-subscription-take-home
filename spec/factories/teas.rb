FactoryBot.define do
  factory :tea do
   title { Faker::Tea.variety }
   description { Faker::Tea.type }
   temperature { [175, 180, 195, 212].sample }
   brew_time {(3..7).to_a.sample}
   end
 end