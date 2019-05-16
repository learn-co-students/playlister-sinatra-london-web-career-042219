class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub " ", "-"
  end

  def self.find_by_slug(slug)
    unslug = slug.split("-").map{|word| word.capitalize}.join(" ")
    Song.where("name LIKE ?", unslug)[0]
  end
end
