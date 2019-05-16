class Song < ActiveRecord::Base
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres

    def slug
        name.downcase.gsub " ", "-"
    end

    def self.unslug( name )
        words = name.downcase.gsub("-"," ").split " "
        words.map {|w| w.capitalize }.join(" ")
    end

    def self.find_by_slug( name )
        Song.where("name like ?", unslug(name)).first
        #Song.find_by(name: unslug(name) ) 
    end
    
end