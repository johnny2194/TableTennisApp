require_relative('../db/sql_runner')

class Group

  attr_reader :id, :g_name, :org_id

  def initialize(group_hash)
    @id = group_hash['id'].to_i
    @g_name = group_hash['g_name']
    @org_id = group_hash['org_id'].to_i
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO groups (g_name, org_id) VALUES ('#{@g_name}', #{@org_id}) RETURNING id"
    group_array_pg = SqlRunner.run(sql)
    @id = group_array_pg.first['id'].to_i
  end

  ### CLASS METHODS

  def self.find_name_by_id(id)
    sql = "SELECT g_name FROM groups WHERE id=#{id}"
    group_pg = SqlRunner.run(sql)
    group_name = group_pg.first['g_name']
    return group_name
  end

  def self.all()
    sql = "SELECT * FROM groups"
    result = SqlRunner.run(sql)
    return result.map {|group| Group.new(group)}
  end

end
