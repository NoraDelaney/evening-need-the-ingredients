require 'sinatra'
require 'pry'

get '/' do
  ingredients = File.readlines('ingredients.txt')
  erb :index, locals: { ingredients: ingredients }
end

post '/ingredients' do
  ingredient = params['ingredient']
  File.open('ingredients.txt', 'a') do |file|
    file.puts(ingredient)
  end

  redirect '/'
end
