require_relative('../db/sql_runner')

class Player

  attr_reader :id, :p_name

  def initialize(player_hash)
    @id = player_hash['id'].to_i
    @p_name = player_hash['p_name']
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO players (p_name) VALUES ('#{@p_name}') RETURNING id"
    players_array_pg = SqlRunner.run(sql)
    @id = players_array_pg.first['id'].to_i
  end

  def wins()
    sql = "SELECT COUNT(winner) FROM games WHERE p1_id=#{self.id} AND winner=1 OR p2_id=#{self.id} AND winner=-1"
    win_amount_pg = SqlRunner.run(sql)
    win_amount_int = win_amount_pg.first['count'].to_i
    return win_amount_int
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM players"
    Player.map_players(sql)
  end

  def self.all_sorted_by_wins()
    p_ob_array = self.all
    sorted = p_ob_array.sort{|x,y| 
    y.wins <=> x.wins }
    return sorted
  end

  ## Helper
  def self.map_players(sql)
    players_pg = SqlRunner.run(sql)
    players_objects_rb = players_pg.map{ |player| 
      Player.new(player)}
    return players_objects_rb
  end

end