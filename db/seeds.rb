require_relative('../models/player')

names = ["Johnny", "Richard", "Irma"]

names.each do |name|
  newPlayer = Player.new({'p_name' => name})
  newPlayer.save
end
