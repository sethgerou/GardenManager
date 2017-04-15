require 'securerandom'

get '/managers/new' do
  erb :'managers/new', layout: false
end

post '/managers' do
  @manager = Manager.create({name: params[:name],
                             zipcode: params[:zipcode],
                             key: SecureRandom.urlsafe_base64(5)
                             })
             Log.create({temp: 0, humidity: 0, light: 0, actuator_state: "closed", manager_id: @manager.id})

  erb :'partials/_manager_info', layout: false
end

get '/managers' do
  @manager = Manager.find_by({name: params[:name]})
  @key = params[:key]
  @name = params[:name]

  if @manager
    if @manager.key == @key
      session[:id] = @manager.id
      erb :'managers/show', layout: false
    else
    p "key does not match"
  end
  else
    p "error"
  end

end

get '/managers/edit' do
  @manager = Manager.find_by(id: session[:id])
  erb :'managers/edit'
end

put 'managers' do

end
