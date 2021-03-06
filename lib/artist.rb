class Artist 

	attr_accessor :name, :songs 

	@@all = []

	def initialize(name)
		@name = name
		@songs = []
	end

	def songs
		@songs
	end

	def add_song(song)
		@songs << song
		song.artist = self
	end

	def self.all 
		@@all
	end

	def save
		@@all << self
		self
	end


	def self.find_by_name(name)
		self.all.find {|artist| artist.name == name}
	end

	def self.create_by_name(name)
		self.new(name).save
	end


	def self.find_or_create_by_name(name)
		if self.find_by_name(name)
			self.find_by_name(name)
		else 
			self.create_by_name(name)
		end
	end


	def print_songs
		self.songs.each {|song| puts song.name}
	end


end 

