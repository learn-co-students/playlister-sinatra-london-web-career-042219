# frozen_string_literal: true

module Slug
  def slug
    name.gsub(/[^ 0-9A-Za-z]/, '').gsub(' ', '-')
  end
end
