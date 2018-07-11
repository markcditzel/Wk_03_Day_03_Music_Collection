require("pry")
require_relative("../models/album")
require_relative("../models/artist")

#FOR TEST CONDITONS - DELETE ALL ARTISTS IN TABLE
#Artist.delete_all()

p artist1 = Artist.new({'name' => 'Prince'})
p artist2 = Artist.new({'name' => 'CAN'})

artist1.save()
