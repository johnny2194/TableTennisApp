require('sinatra')
require('sinatra/contrib/all')

require_relative('models/player')
require_relative('models/game')


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

# PLAYER

get '/player/new' do
  
end