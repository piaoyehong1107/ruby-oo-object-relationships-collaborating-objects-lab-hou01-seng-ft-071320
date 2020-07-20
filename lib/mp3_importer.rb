class MP3Importer
    attr_accessor :file_path,:file_name

    def initialize(file_path)
        @file_path=file_path
    end
    def files(file_path)
        file_name=[]
        file_path.each {|paths|
        paths.split("/")
        file_name.push(new_path.last)
        }
    end

    def import 
        Song.new_by_filename(file_name)
    end

end