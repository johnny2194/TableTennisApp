require_relative('../models/player')
require_relative('../models/game')
require_relative('../models/organisation')

codeclan = Organisation.new({
  'o_name' => 'CodeClan'
  })

codeclan.save

johnny = Player.new({
  'p_name' => 'Johnny',
  'primary_org_id' => codeclan.id
  })

richard = Player.new({
  'p_name' => 'Richard',
  'primary_org_id' => codeclan.id
  })

irma = Player.new({
  'p_name' => 'Irma',
  'primary_org_id' => codeclan.id
})

dominic = Player.new({
  'p_name' => 'Dominic',
  'primary_org_id' => codeclan.id
})

johnny.save
richard.save
irma.save
dominic.save

game1 = Game.new({
  'p1_id' => johnny.id,
  'p2_id' => irma.id,
  # 'winner' => -1
  })
game2 = Game.new({
  'p1_id' => johnny.id,
  'p2_id' => richard.id,
  # 'winner' => 0
  })
game3 = Game.new({
  'p1_id' => richard.id,
  'p2_id' => irma.id,
  # 'winner' => 1
  })
game4 = Game.new({
  'p1_id' => dominic.id,
  'p2_id' => irma.id,
  # 'winner' => 1
  })
game5 = Game.new({
  'p1_id' => dominic.id,
  'p2_id' => johnny.id,
  # 'winner' => 1
  })
game6 = Game.new({
  'p1_id' => richard.id,
  'p2_id' => dominic.id,
  # 'winner' => -1
  })
game7 = Game.new({
  'p1_id' => johnny.id,
  'p2_id' => dominic.id,
  # 'winner' => 1
  })

game1.save
game2.save
game3.save
game4.save
game5.save
game6.save
game7.save
