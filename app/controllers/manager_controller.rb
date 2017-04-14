get '/managers/new' do
  erb :'managers/new', layout: false
end

post 'managers' do
  # @manager = Manager.create(...)
end
