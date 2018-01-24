class LittleShopApp < Sinatra::Base

  get '/merchants' do
    @merchants = Merchant.all
    erb :"merchants/index"
  end

  delete '/merchants/:id' do
    Merchant.find(params[:id]).destroy
    redirect '/merchants'
  end

end
