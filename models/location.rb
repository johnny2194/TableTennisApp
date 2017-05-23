require_relative('../db/sql_runner')

class Location

  attr_reader :id, :l_name

  def initialize(location_hash)
    @id = location_hash['id'].to_i
    @l_name = location_hash['l_name']
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO locations (l_name) VALUES ('#{@l_name}') RETURNING id"
    loc_array_pg = SqlRunner.run(sql)
    @id = loc_array_pg.first['id'].to_i
  end

  ### CLASS METHODS

  def self.find_name_by_id(id)
    sql = "SELECT l_name FROM locations WHERE id=#{id}"
    loc_pg = SqlRunner.run(sql)
    loc_name = loc_pg.first['l_name']
    return loc_name
  end

  def self.all()
    sql = "SELECT * FROM locations"
    result = SqlRunner.run(sql)
    return result.map {|location| Location.new(location)}
  end

end
