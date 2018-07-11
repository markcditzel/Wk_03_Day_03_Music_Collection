require("pry")
require_relative("../models/album")
require_relative("../models/artist")

#Artist.delete_all()

#FOR TEST CONDITONS - DELETE ALL ARTISTS IN TABLE
#Artist.delete_all()

#Print to check that they are created in terminal view
# p artist1 = Artist.new({'name' => 'Prince'})
# p artist2 = Artist.new({'name' => 'CAN'})

artist1 = Artist.new({'name' => 'Prince'})
artist2 = Artist.new({'name' => 'CAN'})
artist3 = Artist.new({'name' => 'Pavement'})

artist1.save()
artist2.save()
artist3.save()

#artist3.delete()

artist3.name = 'The Pavement'
artist3.update()

p album1 = Album.new({'artist_id' => artist2.id, 'title' => 'Sago Mago', 'genre' => 'alt folk!', })

#album1.save
