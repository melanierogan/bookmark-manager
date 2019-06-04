require 'pg'

class Bookmark
  attr_reader :id, :url

  def initialize(id, url)
    @id = id
    @url = url
  end

  def self.all
    connection = PG.connect( dbname: 'bookmark_manager')
    result = connection.exec( "SELECT * FROM bookmarks" )
    result.map { |bookmark| Bookmark.new(bookmark['id'], bookmark['url']) }
  end

  def to_s
    "#{@id} #{@url}"
  end
end
