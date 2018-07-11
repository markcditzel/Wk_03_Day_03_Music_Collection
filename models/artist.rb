require_relative('../db/sql_runner')

class Artist

#TODO check what attrs need to be set

  def initialize(options)
    @id = options['id'].to_i if options['id'] # this will extract 'id' from the provided hash only if an id is present - thereby avoiding a nil assignment
    @name = options['name']
  end
end
