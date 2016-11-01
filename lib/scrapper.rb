require 'nokogiri'

class Scrapper
  attr_reader :doc

  def initialize(doc)
    @doc = build_nokogiri_document(doc)
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

  def build_nokogiri_document(document)
    Nokogiri::HTML(document)
  end
end