require_relative('../models/player')
require_relative('../models/game')

# names = ["Johnny", "Richard", "Irma"]

# names.each do |name|
#   newPlayer = Player.new({'p_name' => name})
#   newPlayer.save
# end

johnny = Player.new({
  'p_name' => 'Johnny'
  })

richard = Player.new({
  'p_name' => 'Richard'
  })

irma = Player.new({
  'p_name' => 'Irma'
})

johnny.save
richard.save
irma.save

game1 = Game.new({
  'p1_id' => johnny.id,
  'p2_id' => irma.id,
  'winner' => -1
  })

game2 = Game.new({
  'p1_id' => johnny.id,
  'p2_id' => richard.id,
  'winner' => 0
  })

game3 = Game.new({
  'p1_id' => richard.id,
  'p2_id' => irma.id,
  'winner' => 1
  })

game1.save
game2.save
game3.save

