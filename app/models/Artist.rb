class Artist < ActiveRecord::Base
    has_many :songs
    has_many :song_genres, through: :songs
    has_many :genres, through: :song_genres

    def slug
        name.downcase.gsub " ", "-"
    end

    def self.unslug( name )
        words = name.downcase.gsub("-"," ").split " "
        words.map {|w| w.capitalize }.join(" ")
    end

    def self.find_by_slug( name )
        Artist.where("name like ?", unslug(name)).first
        #Artist.find_by(name: unslug(name) ) 
    end

end