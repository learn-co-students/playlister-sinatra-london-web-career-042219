# frozen_string_literal: true

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  include Slug

  def self.song_check(params)
    binding.pry
    params[:genres][:ids] = [] if params[:genres][:ids].nil?

    if params[:song][:artist_id] == ''
      params[:song][:artist_id] = Artist.find_or_create_by(params[:artist]).id
    end

    if params[:genres][:name] != ''
      params[:genres][:ids] << Genre.find_or_create_by(name: params[:genres][:name]).id
    end

    song = Song.find_or_create_by(params[:song])
    song.update genre_ids: (params[:genres][:ids])
  end
end
