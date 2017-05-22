require_relative('../db/sql_runner')

class Game

  attr_reader :id, :p1_id, :p2_id, :p1_score, :p2_score, :tstamp, :p1_org_id, :p2_org_id, :p1_group_id, :p2_group_id, :location_id

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


end
