class Song

	attr_accessor :name, :artist

	def initialize(name)
		@name = name
	end

	def self.new_by_filename(filename)
		song_name = filename.split(" - ")[1]
		new_song = Song.new(song_name)
		artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
		#new_song.artist = artist
		artist.add_song(new_song)
		new_song
	end

end 

