require_relative('../db/sql_runner')

class Player

  attr_reader :id, :p_name, :rating, :picture, :primary_org_id

  def initialize(player_hash)
    @id = player_hash['id'].to_i
    @p_name = player_hash['p_name']
    @rating = player_hash['rating'].to_i
    @picture = player_hash['picture']
    @primary_org_id = player_hash['primary_org_id'].to_i
    @primary_group_id = player_hash['primary_group_id'].to_i
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO players 
    (p_name, rating, picture, primary_org_id, primary_group_id)
     VALUES 
     ('#{@p_name}', #{@rating}, '#{@picture}', #{@primary_org_id}, #{@primary_group_id}) 
     RETURNING id"
    players_array_pg = SqlRunner.run(sql)
    @id = players_array_pg.first['id'].to_i
  end

  def wins()
    sql = 
    "SELECT COUNT(id) 
    FROM games
    WHERE 
    p1_score>p2_score AND p1_id=#{self.id} 
    OR 
    p2_score>p1_score AND p2_id=#{self.id}"

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

  def self.delete(id)
    sql = "DELETE FROM players WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  ## Helper
  def self.map_players(sql)
    players_pg = SqlRunner.run(sql)
    players_objects_rb = players_pg.map{ |player| 
      Player.new(player)}
    return players_objects_rb
  end

end