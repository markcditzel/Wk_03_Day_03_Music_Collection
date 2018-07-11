require_relative('../db/sql_runner')

class Album

# TODO explain the attr requirements

  attr_accessor :artist_id, :title, :genre
  attr_reader :id

  def initialize(options)
    @artist_id = options['artist_id']
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
  end

end
