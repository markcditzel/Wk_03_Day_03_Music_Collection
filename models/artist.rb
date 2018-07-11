require_relative('../db/sql_runner')

class Artist

#TODO check what attrs need to be set

  def initialize(options)
    @id = options['id'].to_i if options['id'] # this will extract 'id' from the provided hash only if an id is present - thereby avoiding a nil assignment
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO artists (name) VALUES ($1)
            RETURNING id'
    values = [@name]
    artists = SqlRunner.run(sql,values) # returns the newly created row info as an array of hashes and assigend to artists var
    @id = artists.first['id'].to_i
  end


end
