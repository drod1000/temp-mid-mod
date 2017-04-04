require 'rails_helper'

RSpec.feature 'Authenticated user creates a new link' do
  before(:each) do
    user = create(:user)
    page.set_rack_session(user_id: user.id)
    visit links_path
  end

  context 'successful creation' do
    it 'they can create a link' do

      within('form') do
        fill_in 'link[title]', with: 'Some Title'
        fill_in 'link[url]', with: 'http://someurl.com'
        click_on 'Create Link'
      end

      expect(current_path).to eq(links_path)
      expect(page).to have_content('Some Title')
      expect(page).to have_content('http://someurl.com')
    end
  end

  context 'failed creation' do
    it 'they cannot create link without a title' do
      within('form') do
        fill_in 'link[url]', with: 'http://someurl.com'
        click_on 'Create Link'
      end

      expect(current_path).to eq(links_path)
      expect(page).to have_content("Title can't be blank")
    end
  end
end
