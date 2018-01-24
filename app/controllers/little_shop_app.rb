class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
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
