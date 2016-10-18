class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.all.find_by_id(params["id"].to_i)
    erb :show
  end

  post '/recipes' do
    recipe = Recipe.create(name: params["name"], ingredients: params["ingredients"], cook_time: params["cook_time"])
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.all.find_by_id(params["id"].to_i)
    erb :edit
  end

  patch '/recipes/:id/edit' do
    @recipe = Recipe.all.find_by_id(params["id"].to_i)
    @recipe.update(params["recipe"])
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id/delete' do
    Recipe.all.delete(Recipe.all.find_by_id(params["id"].to_i))
    redirect '/recipes'
  end
end
