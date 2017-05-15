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

dominic = Player.new({
  'p_name' => 'Dominic'
})

johnny.save
richard.save
irma.save
dominic.save

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
game4 = Game.new({
  'p1_id' => dominic.id,
  'p2_id' => irma.id,
  'winner' => 1
  })
game5 = Game.new({
  'p1_id' => dominic.id,
  'p2_id' => johnny.id,
  'winner' => 1
  })
game6 = Game.new({
  'p1_id' => richard.id,
  'p2_id' => dominic.id,
  'winner' => -1
  })
game7 = Game.new({
  'p1_id' => johnny.id,
  'p2_id' => dominic.id,
  'winner' => 1
  })

game1.save
game2.save
game3.save
game4.save
game5.save
game6.save
game7.save
