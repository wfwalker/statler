#!/usr/bin/ruby

require 'CSV'

shakespeareRoles = {}
shakespearePlays = []
osfProductions = []
osfPlays = []
osfVenues = []

CSV.foreach("shakespeare-characters.csv") do |row|
	shakespeareRoles[row[1]] = row

	if (! shakespearePlays.include?(row[2])) then
		shakespearePlays.push(row[2])
	end
end

shakespeare = Playwright.find_by_name("Shakespeare, William")

Play.delete_all()
Role.delete_all()
Venue.delete_all()
Run.delete_all()

shakespearePlays.each { | playName | 
    tmp = Play.new({ :title => playName, :playwright_id => shakespeare.id })
    tmp.save
}

shakespeareRoles.each { | name, data |
	play = Play.find_by_title(data[2])
	tmp = Role.new({ :name => name, :play_id => play.id })
	tmp.save();
}

CSV.foreach("osf-production-history.csv") do |row|
	osfProductions.push(row)
	if (! osfPlays.include?(row[1])) then
		osfPlays.push(row[1])
	end

	if (! osfVenues.include?(row[2])) then
		osfVenues.push(row[2])
	end
end


osfVenues.each { | venueName |
	tmp = Venue.new({ :name => venueName, :organization => 'Oregon Shakespeare Festival'})
	tmp.save();
}


osfProductions.each { | year, playTitle, venueName | 
	venue = Venue.find_by_name(venueName)
	play = Play.find_by_title(playTitle)

	if (play) then
		tmp = Run.new({ :year => year, :play_id => play.id, :venue_id => venue.id })
		tmp.save()
	else
		print "did not find %s\n" % playTitle
	end
}
