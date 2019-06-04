require 'pg'

class Bookmark
  attr_reader :id, :url

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url']) }
  end

  def to_s
    "#{@id} #{@url}"
  end
end
