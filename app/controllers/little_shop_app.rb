require 'will_paginate'
require 'will_paginate/active_record'

class LittleShopApp < Sinatra::Base
	register WillPaginate::Sinatra

	helpers do
		def merchant
			@merchant = Merchant.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				halt(404)
		end

		def item
			@item = Item.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				halt(404)
		end

		def category
			@category = Category.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				halt(404)
		end
	end

  get '/' do
    erb :"homepage"
  end

  get '/merchants' do
    @merchants = Merchant.abc_order.paginate(:page => params[:page])
    erb :"merchants/index"
  end

  get '/merchants/new' do
    erb :"merchants/new"
  end

  get '/merchants/:id' do
    merchant
    erb :"merchants/show"
  end

  get '/merchants/:id/edit' do
    merchant
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
    @items = Item.abc_order.paginate(:page => params[:page])
    erb :"items/index"
  end

  get '/items/new' do
    @merchants = Merchant.order("lower(name)").all
    @categories = Category.order("lower(name)").all
    erb :"items/new"
  end

  get '/items/:id' do
    item
    erb :"items/show"
  end

  get '/items/:id/edit' do
    item
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
    @categories = Category.order("lower(name)").all
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
      category
	    @items = Item.abc_order.where(category_id: params[:id]).paginate(:page => params[:page])
	    erb :"categories/show"
  end

  get '/categories/:id/edit' do
    category
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

  get "/search" do
    if params[:q] == ""
      @query = nil
    else
      @query = [Category.where("lower(name) LIKE ?", "%#{params[:q].downcase}%"),
                Merchant.where("lower(name) LIKE ?", "%#{params[:q].downcase}%"),
                Item.where("lower(title) LIKE ?", "%#{params[:q].downcase}%"),
               ]

      @categories = @query[0]
      @merchants = @query[1].paginate(:page => params[:page], :per_page => 15)
      @items = @query[2].paginate(:page => params[:page], :per_page => 15)
    end
    erb :"/search"
  end

	not_found do
	  status 404
	  erb :not_found
  end

end
