require 'pry'
class Artist
    
    extend Concerns::Findable

    attr_accessor :name, :genres
    attr_reader :songs
    @@all = []

    def initialize(name)
        @name = name 
        @songs = []

    end

    def self.all 
        @@all
    end 

    def self.destroy_all
        @@all.clear
    end

    def save
        @@all << self
    end

    def self.create(artist)
        new_artist = self.new(artist)
        new_artist.save
        new_artist
    end
    
    def add_song(song)
        song.artist = self unless song.artist
        songs << song unless self.songs.include?(song)
    end

    def genres
        # binding.pry
        songs.collect {|song| song.genre }.uniq
    end
    # binding.pry
end