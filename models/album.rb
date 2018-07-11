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

  def save()
    sql = 'INSERT INTO albums (artist_id, title, genre)
    VALUES ($1, $2, $3)
    RETURNING id'
    values = [@artist_id, @title, @genre]
    albums = SqlRunner.run(sql,values)
    @id = albums.first['id'].to_i
  end

  def self.delete_all()
    sql = 'DELETE FROM albums'
    SqlRunner.run(sql)
  end



end
