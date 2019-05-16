# frozen_string_literal: true

class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  post '/songs' do
    if params[:song][:artist_id] == ''
      params[:song][:artist_id] = Artist.find_or_create_by(params[:artist]).id
    end

    if params[:genres][:name] != ''
      params[:genres][:ids] << Genre.find_or_create_by(name: params[:genres][:name]).id
    end

    song = Song.create(params[:song])

    params[:genres][:ids].each do |genre_id|
      SongGenre.find_or_create_by(
        song_id: song.id,
        genre_id: genre_id.to_i
      )
    end
    redirect "/songs/#{song.slug}"
  end

  get '/songs/new' do
    @genres = Genre.all.order(:name)
    @artists = Artist.all.order(:name)
    erb :"songs/new"
  end

  get '/songs/:slug' do
    slug = params[:slug]
    songs = Song.all
    @song = songs.find { |song| song.slug == slug }
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    slug = params[:slug]
    songs = Song.all
    @song = songs.find { |song| song.slug == slug }

    erb :"songs/edit"
  end
end
