require_relative('../db/sql_runner')

class Artist

#TODO check what attrs need to be set

attr_reader :name, :id # id needed to allow creation of album object

attr_writer :name, :id

  def initialize(options)
    @id = options['id'].to_i if options['id'] # this will extract 'id' from the provided hash only if an id is present - thereby avoiding a nil assignment
    @name = options['name']
  end




  def save() # need to write to id to receive the returned id????
    sql = 'INSERT INTO artists (name) VALUES ($1)
            RETURNING id'
    values = [@name]
    artists = SqlRunner.run(sql,values) # returns the newly created row info as an array of hashes and assigend to artists var
    @id = artists.first['id'].to_i
  end

  def delete()
    sql = 'DELETE FROM artists WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values) # dont need to return anything
  end

  def self.delete_all() # this a class method that deletes all entries in table; self identifies equates to the class it is defined in
    sql = 'DELETE FROM artists'
    SqlRunner.run(sql)
  end

  def update() # needs to write to name for update
    sql = 'UPDATE artists SET name = $1
    WHERE id = $2'
    values = [@name, @id] # these are the instance var associated with the object onto which the update method is called; we include both for max versatility
    SqlRunner.run(sql,values) # don't need to return anything
  end



end
