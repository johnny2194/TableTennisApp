require_relative('../db/sql_runner')

class Game

  attr_reader :id, :p1_id, :p2_id, :winner

  def initialize(game_hash)
    @id = game_hash['id'].to_i
    @p1_id = game_hash['p1_id'].to_i
    @p2_id = game_hash['p2_id'].to_i
    @winner = game_hash['winner'].to_i
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO games (p1_id, p2_id) VALUES (#{@p1_id}, #{@p2_id}) RETURNING id"
    game_array_pg = SqlRunner.run(sql)
    @id = game_array_pg.first['id'].to_i
  end


end
