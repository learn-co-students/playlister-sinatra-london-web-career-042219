class Artist < ActiveRecord::Base
  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres

  def slug
    name.downcase.gsub " ", "-"
  end

  def self.find_by_slug(slug)
    unslug = slug.split("-").map{|word| word.capitalize}.join(" ")
    Artist.where("name LIKE ?", unslug)[0]
  end
end
