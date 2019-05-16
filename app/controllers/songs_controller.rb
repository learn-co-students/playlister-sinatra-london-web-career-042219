# frozen_string_literal: true

class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  post '/songs' do
    Song.song_check(params)
    redirect "/songs/#{params[:song].slug}"
  end

  get '/songs/new' do
    @genres = Genre.all.order(:name)
    @artists = Artist.all.order(:name)
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    Song.song_check(params)
    redirect "/songs/#{Song.find_by(name:params[:song][:name]).slug}"
  end
end
