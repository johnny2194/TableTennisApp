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

end