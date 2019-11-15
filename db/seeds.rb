# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ing_serialized = JSON.parse(open(url).read)

ing_serialized["drinks"].each do |drink|
  Ingredient.create(name: drink["strIngredient1"])
end

cocktail1 = Cocktail.new(name: "Mojito")
url1 = "https://images.unsplash.com/photo-1509448613959-44d527dd5d86?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1920&q=80"
cocktail1.remote_photo_url = url1
cocktail1.save
Dose.create!(description: "1 1/2 oz White rum", ingredient: Ingredient.find_by(name: "Lime juice"), cocktail: cocktail1)
Dose.create!(description: "200ml of Water", ingredient: Ingredient.find_by(name: "Water"), cocktail: cocktail1)
Dose.create!(description: "Sugar syrup to your liking", ingredient: Ingredient.find_by(name: "Sugar syrup"), cocktail: cocktail1)
Dose.create!(description: "A slice of lemon", ingredient: Ingredient.find_by(name: "Lemon"), cocktail: cocktail1)

cocktail2 = Cocktail.new(name: "Calpirinia")
url2 = "https://images.unsplash.com/photo-1514361892635-6b07e31e75f9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80"
cocktail2.remote_photo_url = url2
cocktail2.save
Dose.create!(description: "1 1/2 oz of Pisco", ingredient: Ingredient.find_by(name: "Pisco"), cocktail: cocktail2)
Dose.create!(description: "100ml of cold Water", ingredient: Ingredient.find_by(name: "Water"), cocktail: cocktail2)
Dose.create!(description: "2 cups of Triple sec", ingredient: Ingredient.find_by(name: "Triple sec"), cocktail: cocktail2)
Dose.create!(description: "A slice of lemon for decoration", ingredient: Ingredient.find_by(name: "Lemon"), cocktail: cocktail2)
Dose.create!(description: "A table spoon of Orange bitters", ingredient: Ingredient.find_by(name: "Orange bitters"), cocktail: cocktail2)
