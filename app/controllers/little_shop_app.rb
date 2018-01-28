class LittleShopApp < Sinatra::Base

  get '/' do
    erb :"homepage"
  end

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/edit"
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{id}"
  end

  delete '/merchants/:id' do
    Merchant.find(params[:id]).destroy
    redirect '/merchants'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/items' do
    @items = Item.all
    erb :"items/index"
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :"items/new"
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    erb :"items/show"
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :"items/edit"
  end

  put '/items/:id' do |id|
    Item.update(id.to_i, params[:item])
    redirect "/items/#{id}"
  end

  delete '/items/:id' do
    Item.find(params[:id]).destroy
    redirect '/items'
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  get '/items-dashboard' do
    @items = Item.all
    erb :"items/dashboard"
  end

  get '/categories' do
    @categories = Category.all
    erb :"categories/index"
  end

  get '/categories/new' do
    erb :"/categories/new"
  end

  post '/categories' do
    Category.create(params[:category])
    redirect '/categories'
  end

  get '/categories/:id' do
    @category = Category.find(params[:id])
    erb :"categories/show"
  end

  get '/categories/:id/edit' do
    @category = Category.find(params[:id])
    erb :"categories/edit"
  end

  put '/categories/:id' do |id|
    Category.update(id.to_i, params[:category])
    redirect "/categories/#{id}"
  end

  get '/categories-dashboard' do
    @categories = Category.all
    @items = Item.all
    erb :"categories/dashboard"
  end

  get '/merchants-dashboard' do
    @merchants = Merchant.all
    @items = Item.all
    erb :"merchants/dashboard"
  end


end
