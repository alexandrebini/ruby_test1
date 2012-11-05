# encoding: utf-8
module Slug
  def to_slug(string)
    slug = string.downcase
    slug.gsub! /[áàâäã]/, 'a'
    slug.gsub! /[éèêë]/, 'e'
    slug.gsub! /[íìîï]/, 'i'
    slug.gsub! /[óòôöõ]/, 'o'
    slug.gsub! /[úùûü]/, 'u'
    slug.gsub! /[ç]/, 'c'
    slug.gsub! ' - ', '-'
    slug.gsub! ' ', '-'
    slug.gsub! '--', '-'
    slug.gsub!(/[^a-zA-Z0-9 -]/, '')
    slug
  end
end