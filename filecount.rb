#!/bin/usr/ruby

directories = Array.new
directories = Dir.glob('/'"**/")
directories.sort!
directories.each do |countycount|
	filecount = Dir.glob(File.join(countycount, '**', '*')).select { |file| File.file?(file) }.count
	puts "#{countycount}|#{filecount}"
end
