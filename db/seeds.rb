# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(2010...2020).to_a.each do |year|
  details = Faker::Vehicle.make_and_model.scan /\w+/
  make = details[0]
  model = details[1]
  Vehicle.create(
    [
      {make: make, model: model, year: year.to_s, description: Faker::Vehicle.standard_specs.join("\n")}
    ]
  )
end

