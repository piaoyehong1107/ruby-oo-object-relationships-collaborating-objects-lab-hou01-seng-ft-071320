class Artist
    attr_accessor :name
    @@all=[]
    def initialize(name)
        @name=name
        @@all << self
    end
    def self.all
        @@all
    end
    def songs
        Song.all.find_all do |song|
            song.artist==self
        end
    end
 
    def add_song(song)
        song.artist=self
        self.songs
    end

    def self.find_or_create_by_name(name)
        if artist1=@@all.find{|value|
            value.name==name
        }
        artist1
        else
        new_aritist=Artist.new(name)
        end
    end

    def print_songs
       self.songs.each{|values|
        puts values.name}
    end
end