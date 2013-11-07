require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      expect(page).to have_content('home')
      # get static_pages_index_path
      # response.status.should be(200)
    end

    it "title shoud content 'DJiango | '" do
      visit '/static_pages/home'
      expect(page).to have_title("DJiango | ")
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('help')
    end

    it "title shoud content 'DJiango | '" do
      visit '/static_pages/home'
      expect(page).to have_title("DJiango | ")
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('about')
    end

    it "title shoud content 'DJiango | '" do
      visit '/static_pages/home'
      expect(page).to have_title("DJiango | ")
    end
  end
end
