class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    name.downcase.gsub " ", "-"
  end

  def self.find_by_slug(slug)
    unslug = slug.split("-").map{|word| word.capitalize}.join(" ")
    Genre.where("name LIKE ?", unslug)[0]
  end
end
