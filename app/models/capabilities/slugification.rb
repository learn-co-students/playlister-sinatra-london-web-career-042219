# frozen_string_literal: true

module Slug
  module SlugClass
    def find_by_slug(slug)
      all.find { |item| item.slug == slug }
    end
  end

  def self.included(base)
    base.extend(SlugClass)
  end

  def slug
    name.gsub(/[^ 0-9A-Za-z]/, '').gsub(' ', '-').downcase
  end
end
