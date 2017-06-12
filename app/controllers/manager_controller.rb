require 'securerandom'

get '/managers/new' do
  @manager = Manager.new()
  erb :'managers/new', layout: false
end

post '/managers' do
  @manager = Manager.create({name: params[:name],
                             zipcode: params[:zipcode],
                             key: SecureRandom.urlsafe_base64(5)
                             })
             Log.create({temp: 0, humidity: 0, light: 0, actuator_state: "closed", manager_id: @manager.id})
  if @manager.valid?
    erb :'partials/_manager_info', layout: false
  else
    erb :'managers/new', layout: false
  end
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
  erb :'managers/edit', layout: false
end

put '/managers' do
  @manager = Manager.find_by(id: session[:id])
  @manager.update({
                  zipcode: params[:zipcode],
                  mode: params[:mode],
                  roof_open_temp: params[:roof_open_temp],
                  roof_close_temp: params[:roof_close_temp]
                  })
  if @manager.valid?
    erb :'managers/show', layout: false
  else
    erb :'managers/edit', layout: false
  end
end
