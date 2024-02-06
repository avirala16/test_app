require 'rails_helper'

RSpec.describe "InspectTestApps", type: :system do
  before do
    driven_by(:rack_test)
  end

  # Checks to make sure new books are added successfully
  it 'adding a new book' do
    visit '/books/new'
    fill_in 'Title', with: 'Hello!'
    click_on 'Create Book'

    expect(page).to have_content('Book was successfully created.')

    book = Book.order("id").last
    expect(book.title).to eq('Hello!')
  end
end
