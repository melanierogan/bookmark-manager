feature 'Visiting landing page' do

  scenario 'has a landing page' do
    visit '/'
    expect(page).to have_css('h1', text: 'Bookmarks')
  end
end

feature 'Viewing bookmarks' do
  scenario 'can view a list of bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('4')
    expect(page).to have_content('http://www.google.com')
  end
end
