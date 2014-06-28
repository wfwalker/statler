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

CSV.foreach("artists.csv") do |row|
	artistName = row[0]

    tmp = Artist.new({ :name => artistName })
    tmp.save
end

CSV.foreach("other-plays.csv") do |row|
	playwright = Playwright.find_by_name(row[0])

	if (! playwright) then
		newPlaywright = Playwright.new({ :name => row[0] })
		newPlaywright.save
		playwright = newPlaywright
	end

	play = Play.find_by_title(row[1])
	if (! play) then
		newPlay = Play.new({ :title => row[1], :playwright_id => playwright.id })
		newPlay.save
	end
end

shakespeare = Playwright.new({ :name => "Shakespeare, William" })
shakespeare.save

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

# "Donohue, Dan","Hamlet","Hamlet","Angus Bowmer Theatre",2010
CSV.foreach("performances.csv") do |row|
	artist = Artist.find_by_name(row[0])
	raise "missing artist %s\n" % row[0] if (! artist)

	play = Play.find_by_title(row[2])
	raise "missing play %s\n" % row[2] if (! play)

	role = Role.find_by_name(row[1])
	if (! role) then
		print "Create role %s for %s\n" % [row[1], play.title]
		role = Role.new({ :play_id => play.id, :name => row[1] })
		role.save()
	end
	raise "missing role %s\n" % row[1] if (! role)

	run = Run.find_by_year_and_play_id(row[4], play.id)
	raise "missing run \'%s\' \'%s\' (%d)\n" % [row[4], play.title, run.length] if (run.length != 1)

	print "found run %s\n" % [run[0].year_and_play]

	tmp = Performance.new({ :run_id => run[0].id, :artist_id => artist.id, :role_id => role.id })
	tmp.save()
end
