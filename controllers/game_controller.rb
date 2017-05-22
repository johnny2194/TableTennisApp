require('sinatra')
require('sinatra/contrib/all')

require_relative('../models/player')
require_relative('../models/game')
require_relative('../models/group')
require_relative('../models/organisation')

# GAME

get '/game/new' do
  @players = Player.all
  @organisations = Organisation.all
  @groups = Group.all
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


# p1_score INT4,
# p2_score INT4,
# tstamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP(2),
# p1_org_id INT4 REFERENCES organisations(id) ON DELETE CASCADE,
# p2_org_id INT4 REFERENCES organisations(id) ON DELETE CASCADE,
# p1_group_id INT4 REFERENCES groups(id) ON DELETE CASCADE,
# p2_group_id INT4 REFERENCES groups(id) ON DELETE CASCADE,
# location_id INT4 REFERENCES organisations(id) ON DELETE CASCADE
