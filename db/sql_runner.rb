require('pg')

class SqlRunner
  def self.run(sql,values =[])
    begin
      db =PG.connect({dbname: 'music_collection', host: 'localhost'})
      db.prepare('template',sql)
      result = db.exec_prepared('template',values)
    ensure
      db.close() if db # this ensures that the db will close even if SR cannot connect and returns nil into debug
    end

    return result

  end
end
