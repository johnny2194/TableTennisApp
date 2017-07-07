require_relative('../db/sql_runner')

class Game

  attr_reader :id, :p1_id, :p2_id, :tstamp, :p1_org_id, :p2_org_id, :p1_group_id, :p2_group_id, :location_id
  attr_accessor :p1_score, :p2_score

  def initialize(game_hash)
    @id = game_hash['id'].to_i if game_hash['id']
    @p1_id = game_hash['p1_id'].to_i
    @p2_id = game_hash['p2_id'].to_i
    @p1_score = game_hash['p1_score'].to_i
    @p2_score = game_hash['p2_score'].to_i
    # @tstamp = 0
    @p1_org_id = game_hash['p1_org_id'].to_i
    @p2_org_id = game_hash['p2_org_id'].to_i
    @p1_group_id = game_hash['p1_group_id'].to_i
    @p2_group_id = game_hash['p2_group_id'].to_i
    @location_id = game_hash['location_id'].to_i
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO games
    (p1_id, p2_id, p1_score, p2_score, p1_org_id, p2_org_id, p1_group_id, p2_group_id, location_id)
    VALUES
    (#{@p1_id}, #{@p2_id}, #{@p1_score}, #{@p2_score}, #{@p1_org_id}, #{@p2_org_id}, #{@p1_group_id}, #{@p2_group_id}, #{@location_id})
    RETURNING *"
    game_array_pg = SqlRunner.run(sql)
    @id = game_array_pg.first['id'].to_i
    @tstamp = game_array_pg.first['tstamp']
  end

  def update()
    sql = "UPDATE games SET (p1_id, p2_id, p1_score, p2_score, p1_org_id, p2_org_id, p1_group_id, p2_group_id, location_id) =  (#{@p1_id}, #{@p2_id}, #{@p1_score}, #{@p2_score}, #{@p1_org_id}, #{@p2_org_id}, #{@p1_group_id}, #{@p2_group_id}, #{@location_id}) WHERE id = #{self.id}" 
    SqlRunner.run(sql)
  end

  ### CLASS METHODS

  def self.all()
    sql = "SELECT * FROM games"
    return Game.map_games(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM games WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM games WHERE id = #{id}"
    return Game.map_games(sql).first
  end

  ## Helper
  def self.map_games(sql)
    games_pg = SqlRunner.run(sql)
    games_rb = games_pg.map{ |game| Game.new(game)}
    games_rb.sort{|x,y| x.tstamp <=> y.tstamp}
    return games_rb
  end

end
