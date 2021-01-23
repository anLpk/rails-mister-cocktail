puts "cleaning up database"
Cocktail.destroy_all

puts "database is clean"

puts 'Creating 5 coctails...'

cocktails_att = [
  {
    name: "Light rum",
    rating: 4,
    review: Faker::Quote.matz,
    
  },

  {
    name: "Applejack",
    rating: 3,
    review: Faker::Quote.matz,
    
  },

  {
    name: "Dark rum",
    rating: 5,
    review: Faker::Quote.matz,
    
  },

  {
    name: "Sweet Vermouth",
    rating: 2,
    review: Faker::Quote.matz,
    
  },

  {
    name: "Strawberry schnapps",
    rating:  5,
    review: Faker::Quote.matz,
    
  }

]

Cocktail.create!(cocktails_att)
puts 'Finished!'

require 'open-uri'
Ingredient.delete_all
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
result = JSON.parse(json)
result['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end
