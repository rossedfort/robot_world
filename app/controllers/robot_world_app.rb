require 'models/robot_world'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true
  
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
    erb :show
  end

  get '/bots/:id/edit' do |id|
    @robot = RobotWorld.find(id.to_i)
    erb :edit
  end

  put '/bots/:id' do |id|
    RobotWorld.update(id.to_i, params[:robot])
    redirect '/bots'
  end

  delete '/bots/:id' do |id|
    RobotWorld.delete(id.to_i)
    redirect '/bots'
  end

  not_found do
    erb :error
  end
end
