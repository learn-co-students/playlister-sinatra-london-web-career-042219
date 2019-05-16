# frozen_string_literal: true

require_relative './capabilities/slugification.rb'

class Artist < ActiveRecord::Base
  include Slug
  has_many :songs
  has_many :genres, through: :songs
end
