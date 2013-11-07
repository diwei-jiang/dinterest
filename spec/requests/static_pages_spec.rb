require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "DJiango" }

  describe "Home page" do
    it "should have the content 'home'" do
      visit '/static_pages/home'
      expect(page).to have_content('Home')
    end
    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title("DJiango")
    end
    it "should not have a custom page title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end

  describe "Help page" do 
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
    it "title should contain base title and page title" do
      visit '/static_pages/help'
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About us')
    end
    it "title should contain base title and page title" do
      visit '/static_pages/about'
      expect(page).to have_title("#{base_title} | About us")
    end
  end

  describe "Contact page" do 
    it "should have the content 'Contact us'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact us')
    end
    it "title should contain base title and page title" do
      visit '/static_pages/contact'
      expect(page).to have_title("#{base_title} | Contact us")
    end
  end
end
