# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
customer = Customer.create!(id: 1, first_name: 'Maddie', last_name: 'Marks', email: "maddie@maddie.net", address: "620 W 11th St, Madison, MN, 55023" )
tea_1 = Tea.create!(title: "Black", description: "Just black tea", temperature: 212, brew_time: 5)
tea_2 = Tea.create!(title: "Oolong", description: "Black tea", temperature: 212, brew_time: 5)
tea_3 = Tea.create!(title: "Earl Gray", description: "Also a type of black tea", temperature: 212, brew_time: 4)
