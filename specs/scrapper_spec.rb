require 'minitest/autorun'
require './lib/scrapper'

describe Scrapper do
  let(:scrapper) do
    Scrapper.new(File.read('./specs/support/index.html'))
  end

  describe '#anchor_by' do
    describe 'when scrapping only anchor tags into div with id #references' do
      let(:response) do
        scrapper.anchor_by('div#references a')
      end

      it 'includes link to google' do
        assert_includes(
          response,
          '<a href="http://www.google.com">Click here</a>'
        )
      end

      it 'includes link to learnpythonthehardway' do
        assert_includes(
          response,
          '<a href="http://learnpythonthehardway.org/">Zed Shaw\'s Learn Python the Hard Way</a>'
        )
      end

      it 'include linkt to bing' do
        assert_includes(
          response,
          '<a href="http://www.bing.com">click here to go</a>'
        )
      end
    end
  end

  describe '#title' do
    it 'returns the pages title properly' do
      assert_equal(scrapper.title, '<title>My webpage</title>')
    end
  end

  describe '#paragraph_for' do
    it do
      assert_equal(
        scrapper.paragraph_for('#funstuff p'),
        "<p>Here are some entertaining links:</p>"
      )
    end
  end
end