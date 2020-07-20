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
        new_aritist.name=name
       if arr=@@all.find_all {|value|
            value.name==name
        }
        arr.first
        else
            new_aritist
        end
    end

    def print_songs
       self.songs.each{|values|
        puts values.name}
    end
end
