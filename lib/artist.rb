require "pry"
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
        new_aritist=Artist.new(name)
       if aritist1=@@all.find {|value|
            value.name==name
        }
            return new_aritist = aritist1
        else
            return new_aritist
        end
    end

    def print_songs
       self.songs.each{|values|
        puts values.name}
    end
end
