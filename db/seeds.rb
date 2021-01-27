require 'open-uri'

puts "cleaning up database"
Cocktail.destroy_all

puts "database is clean"

# puts 'Creating 8 coctails...'

# file = URI.open('https://images.unsplash.com/photo-1575835522414-197e77e2fe83?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=634&q=80')
# cocktail = Cocktail.new(name: 'Applejack', rating: 4)
# cocktail.photo.attach(io: file, filename: 'applejack.jpg', content_type: 'image/jpg')
# cocktail.save

# file_2 = URI.open('https://images.unsplash.com/photo-1592483648228-b35146a4330c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=666&q=80')
# cocktail2 = Cocktail.new(name: 'Sweet Vermouth', rating: 5)
# cocktail2.photo.attach(io: file_2, filename: 'sweetvermouth.jpg', content_type: 'image/jpg')
# cocktail2.save

# file_3 = URI.open('https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
# cocktail3 = Cocktail.new(name: 'Strawberry Schnapps', rating: 5)
# cocktail3.photo.attach(io: file_3, filename: 'strawberryschnapps.jpg', content_type: 'image/jpg')
# cocktail3.save

# file_4 = URI.open('https://images.unsplash.com/photo-1592483648228-b35146a4330c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=666&q=80')
# cocktail4 = Cocktail.new(name: 'Sweet Vermouth', rating: 5)
# cocktail4.photo.attach(io: file_4, filename: 'sweetvermouth.jpg', content_type: 'image/jpg')
# cocktail4.save

# file_5 = URI.open('https://images.unsplash.com/photo-1596463989140-3b600dab72e5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
# cocktail5 = Cocktail.new(name: 'Mr Red Neck', rating: 5)
# cocktail5.photo.attach(io: file_5, filename: 'mrredneck.jpg', content_type: 'image/jpg')
# cocktail5.save

# file_6 = URI.open('https://images.unsplash.com/photo-1598994341109-6e9076eb99f8?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
# cocktail6 = Cocktail.new(name: 'Sweet Hell', rating: 4)
# cocktail6.photo.attach(io: file_6, filename: 'sweethell.jpg', content_type: 'image/jpg')
# cocktail6.save

# file_7 = URI.open('https://images.unsplash.com/photo-1541807120430-f3f78c281225?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80')
# cocktail7 = Cocktail.new(name: 'Voodoo', rating: 2)
# cocktail7.photo.attach(io: file_7, filename: 'voodoo.jpg', content_type: 'image/jpg')
# cocktail7.save

# file_8 = URI.open('https://images.unsplash.com/photo-1542849187-5ec6ea5e6a27?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1047&q=80')
# cocktail8 = Cocktail.new(name: 'Turkish Delight', rating: 5)
# cocktail8.photo.attach(io: file_8, filename: 'turkishdelight.jpg', content_type: 'image/jpg')
# cocktail8.save

# puts 'Finished!'


Ingredient.delete_all
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json = open(url).read
result = JSON.parse(json)
result['drinks'].each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end
