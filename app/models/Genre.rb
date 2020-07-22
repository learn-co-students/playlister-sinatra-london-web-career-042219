class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    def slug
        name.downcase.gsub " ", "-"
    end

    def self.unslug( name )
        words = name.downcase.gsub("-"," ").split " "
        words.map {|w| w.capitalize }.join(" ")
    end

    def self.find_by_slug( name )
        Genre.where("name like ?", unslug(name)).first
   #     find_by(name: unslug(name) ) 
    end

end