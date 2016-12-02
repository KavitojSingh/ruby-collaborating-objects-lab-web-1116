require 'pry'

class MP3Importer

	attr_accessor :path 

	def initialize(path)
		@path = path
	end


	def files
		Dir.entries(path)[2..-1]
	end


	def import
		files.each do |filename|
			artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
			artist.songs << Song.new_by_filename(filename)
		end
	end


end

