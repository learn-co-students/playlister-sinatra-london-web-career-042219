# frozen_string_literal: true

class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/genres/:slug' do
    slug = params[:slug]
    genres = Genre.all
    @genre = genres.find { |genre| genre.slug == slug }
    erb :"genres/show"
  end
end
