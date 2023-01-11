FactoryBot.define do
  factory :subscription do
   title { ['Herbal', 'Flavored', 'Caffeinated', 'Black', 'Variety'].sample }
   price { 30 }
   status { ['Active', 'Cancelled'].sample }
   frequency { ['Weekly', 'Biweekly', 'Monthly', 'Bimonthly'].sample }
   end
 end