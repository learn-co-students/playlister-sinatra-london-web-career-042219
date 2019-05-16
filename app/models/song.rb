# frozen_string_literal: true

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  include Slug

  def self.song_check(params)
    params[:genres][:ids] = [] if params[:genres][:ids].nil?

    if params[:song][:artist_id] == ''
      params[:song][:artist_id] = Artist.find_or_create_by(params[:artist]).id
    end

    if params[:genres][:name] != ''
      params[:song][:genre_ids] << Genre.find_or_create_by(name: params[:genres][:name]).id
    end

    song = Song.find_or_create_by(name: params[:song][:name])
    song.update artist_id: (params[:song][:artist_id])
    song.update genre_ids: (params[:song][:genre_ids])
  end
end
