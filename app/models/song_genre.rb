# frozen_string_literal: true

class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
end
