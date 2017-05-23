require('sinatra')
require('sinatra/contrib/all')

require_relative('controllers/admin_controller')
require_relative('controllers/game_controller')
require_relative('controllers/player_controller')

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

not_found do
  erb(:error)
end
