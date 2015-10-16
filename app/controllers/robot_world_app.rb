class RobotWorldApp < Sinatra::Base
  set :method_override, true
  set :root, File.expand_path("..", __dir__)

  get '/' do
    erb :home
  end

  get '/bots' do
    @robots = RobotWorld.all
    erb :index
  end

  get '/bots/new' do
    erb :new
  end

  post '/bots' do
    RobotWorld.create(params[:robot])
    redirect '/bots'
  end

  get '/bots/:id' do |id|
    @robot = RobotWorld.find(id.to_i)
    @robots = RobotWorld.all
    erb :show
  end

  get '/bots/:id/edit' do |id|
    @robot = RobotWorld.find(id.to_i)
    @robots = RobotWorld.all
    erb :edit
  end

  put '/bots/:id' do |id|
    RobotWorld.update(id.to_i, params[:robot])
    redirect "/bots/#{id}"
  end

  delete '/bots/:id' do |id|
    RobotWorld.delete(id.to_i)
    redirect '/bots'
  end

  get '/dashboard' do
    @robots = RobotWorld.all
    erb :dashboard
  end

  not_found do
    erb :error
  end
end
