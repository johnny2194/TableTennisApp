class Pl_group_join

  attr_reader :id, :p_id, :group_id

  def initialize(entry_hash)
    @id = entry_hash['id'].to_i
    @p_id = entry_hash['p_id'].to_i
    @group_id = entry_hash['group_id'].to_i
  end

  ### INSTANCE METHODS

  def save()
    sql = "INSERT INTO pl_group_join (p_id, group_id) VALUES (#{@p_id}, #{@group_id}) RETURNING id"
    entry_array_pg = SqlRunner.run(sql)
    @id = entry_array_pg.first['id'].to_i
  end

end
