class Song
    attr_accessor :name, :artist 
    @@all = []

    def initialize(name)
        @name = name
        @@all << self

    end

    def self.all
        @@all
    end

    def self.new_by_filename(file_name)
        song_name = file_name.split(" - ")[1]
        song = self.new(song_name)
        song_artist = file_name.split(" - ")[0]
        song.artist = Artist.find_or_create_by_name(song_artist)
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

  
end