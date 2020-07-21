class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
#        puts "in files, path=#{@path}"
#        puts "wd=#{Dir.getwd.sub(/.*ruby(.*)/, '\1')}"
        filenames = Dir.chdir(@path) do | path |
#            puts path
            Dir.glob("*.mp3")
        end
        puts "names=#{filenames}"
        filenames
    end
   
    def import
       self.files.each{|value|
        Song.new_by_filename(value.split(" - ")[0])}
    end
end