require './lib/bookmark.rb'

describe '.all' do
  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.makersacademy.com')
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
    expect(bookmarks).to include('http://www.google.com')
  end
end

describe '.new' do
  it 'creates a new bookmark title' do
    bookmark = Bookmark.new(1, 'http://google.com')
    expect(bookmark.id).to eq(1)
  end

  it 'creates a new bookmark url' do
    bookmark = Bookmark.new(1, 'http://google.com')
    expect(bookmark.url).to eq('http://google.com')
  end
end

describe '#to_s' do
  it 'converts element to string' do
    bookmark = Bookmark.new(1, 'http://google.com')
    expect(bookmark.to_s).to eq("1 http://google.com")
  end
end
