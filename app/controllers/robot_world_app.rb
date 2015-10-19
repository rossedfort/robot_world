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
    time = Time.new
    year = time.year
    @ages = @robots.map { |bot| year - bot.birthdate[0..4].to_i }.reduce(:+)/@robots.size
    @years = @robots.map { |bot| bot.date_hired[0..4].to_i }.inject(Hash.new(0)) {|year,count| year[count] += 1; year }.sort
    @departments = @robots.map { |bot| bot.department }.inject(Hash.new(0)) {|department,count| department[count] += 1; department }.sort
    @cities = @robots.map { |bot| bot.city }.inject(Hash.new(0)) {|city,count| city[count] += 1; city }.sort
    @states = @robots.map { |bot| bot.state }.inject(Hash.new(0)) {|state,count| state[count] += 1; state }.sort
    erb :dashboard
  end

  not_found do
    erb :error
  end
end
