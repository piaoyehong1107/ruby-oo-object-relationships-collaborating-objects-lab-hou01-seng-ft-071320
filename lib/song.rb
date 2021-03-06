class Song
    attr_accessor :name, :artist
    @@all=[]
    def initialize(name)
        @name=name
        @@all<<self
    end
    def self.all
        @@all
    end
    def artist
        self.artist=@artist
    end

    def self.new_by_filename(file_name)
        file_name=file_name.split(" - ")
        new_song=self.new(file_name[1])
        new_song.artist_name=file_name[0]
        new_song
    end

    def artist_name=(artist_name)
        self.artist=Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
    end
end