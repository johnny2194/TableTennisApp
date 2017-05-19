require_relative('../db/sql_runner')

class Organisation 

  attr_reader :id, :o_name

  def initialize(org_hash)
    @id = org_hash['id'].to_i
    @o_name = org_hash['o_name']
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO organisations (o_name) VALUES ('#{@o_name}') RETURNING id"
    org_array_pg = SqlRunner.run(sql)
    @id = org_array_pg.first['id'].to_i
  end

end