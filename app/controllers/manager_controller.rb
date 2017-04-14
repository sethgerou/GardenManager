require 'securerandom'

get '/managers/new' do
  erb :'managers/new', layout: false
end

post '/managers' do
  @manager = Manager.create({name: params[:name],
                             zipcode: params[:zipcode],
                             key: SecureRandom.urlsafe_base64(5)
                             })
  erb :'partials/_manager_info', layout: false
end
