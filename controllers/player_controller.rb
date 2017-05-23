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
