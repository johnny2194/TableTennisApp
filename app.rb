require('sinatra')
require('sinatra/contrib/all')

require_relative('models/player')


get '' do
  redirect '/'
end

get '/' do 
  @players = Player.all_sorted_by_wins
  erb(:leaderboard) 
end
