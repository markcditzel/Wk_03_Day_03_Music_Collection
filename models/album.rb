require_relative('../db/sql_runner')
require_relative('artist.rb')

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

  def self.delete_all() # Class method on self
    sql = 'DELETE FROM albums'
    SqlRunner.run(sql)
  end

  def delete()
    sql = 'DELETE FROM albums WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.list_all ()
    sql = 'SELECT * FROM albums'
    albums = SqlRunner.run(sql)#no values needed
    return albums.map {|album| Album.new(album)}
  end

  def artist() # this will return a single artist from the db; we call it on the album object
    sql = "SELECT * FROM artists
    WHERE id = $1"
    values = [@artist_id]
    artists = SqlRunner.run(sql,values)
    artists_hash = artists.first
    artist = Artist.new(artists_hash)
    return artist
  end


end
