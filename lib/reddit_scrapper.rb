require 'nokogiri'
require 'open-uri'

class RedditScrapper
  attr_reader :url

  def initialize
    @url      = 'https://www.reddit.com/r/ruby/'
    @document = build_document
  end

  def most_liked_ruby_articles
    storage = articles.inject({}) do |hash, art|
      likes, href = catch_likes(art), catch_url(art)

      hash[likes] = href
      hash
    end

    storage.sort_by { |key, _value| key.to_i }.reverse.take(5).to_h
  end

  private

  def articles
    @articles ||= @document.css('div.thing')
  end

  def catch_url(article)
    article.css('p.title a').first['href']
  end

  def catch_likes(article)
    article.css('div.midcol').css('div.likes').first.text
  end

  def build_document
    Nokogiri::HTML(open(url))
  end
end