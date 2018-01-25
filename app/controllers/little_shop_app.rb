class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :"merchants/show"
  end

  delete '/merchants/:id' do
    Merchant.find(params[:id]).destroy
    redirect '/merchants'
  end





  get '/merchants/new' do
    erb :"merchants/new"
  end

  post '/merchants' do
    merchant = Merchant.new(params[:merchant])
    merchant.save
    redirect '/merchants'
  end


end
