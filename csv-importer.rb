#!/usr/bin/ruby

require 'CSV'

shakespeareRoles = {}
shakespearePlays = []
osfProductions = []
osfPlays = []

CSV.foreach("shakespeare-characters.csv") do |row|
	shakespeareRoles[row[1]] = row

	if (! shakespearePlays.include?(row[2])) then
		shakespearePlays.push(row[2])
	end
end

shakespeare = Playwright.find_by_name("Shakespeare, William")

Play.delete_all()
Role.delete_all()

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
end

