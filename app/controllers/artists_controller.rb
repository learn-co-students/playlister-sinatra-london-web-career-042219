# frozen_string_literal: true

class ArtistsController < ApplicationController
  get '/artists' do
    @artists = Artist.all
    erb :"artists/index"
  end

  get '/artists/:slug' do
    slug = params[:slug]
    artists = Artist.all
    @artist = artists.find { |artist| artist.slug == slug }
    erb :"artists/show"
  end
end
