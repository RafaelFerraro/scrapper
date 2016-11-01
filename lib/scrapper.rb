require 'nokogiri'

class Scrapper
  attr_reader :doc

  def initialize
    @doc = Nokogiri::HTML(file_content)
  end

  def title
    doc.css('title').to_s
  end

  def paragraph_for(elements)
    doc.css(elements).to_s
  end

  def anchor_by(elements)
    doc.css(elements).to_s
  end

  private

  def file_content
    File.read('./docs/index.html')
  end
end