class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  delete '/merchants/:id' do |id|
    Merchant.find(id).destroy
    redirect '/merchants'
  end

end
