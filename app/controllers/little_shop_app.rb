class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
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

end
