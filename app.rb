require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/admin_controller')

require_relative('models/player')
require_relative('models/game')

enable :sessions

get '' do
  redirect '/'
end

get '/' do
  @players = Player.all_sorted_by_wins
  erb(:'game/leaderboard')
end

# GAME

get '/game/new' do
  @players = Player.all
  erb(:'game/new')
end

post '/game/new/result' do
  @p1_id = params[:p1_id].to_i
  @p2_id = params[:p2_id].to_i
  @winner = params[:winner].to_i

  @new_result = Game.new({
    'p1_id' => @p1_id,
    'p2_id' => @p2_id,
    'winner' => @winner
    })
  @new_result.save
  redirect '/'
end

not_found do
  erb(:error)
end
  # PLAYER

get '/player/new' do
  erb(:'player/new')
end

post '/player/new' do
  @new_player = Player.new(params)
  @new_player.save
  redirect '/'
end

get '/player/index' do
  @message = session[:admin]
  @players = Player.all
  erb(:'player/index')
end
