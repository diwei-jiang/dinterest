require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Welcome') }
    it { should have_title("DJiango") }
    it { should_not have_title('| Home') }
  end

  describe "Help page" do 
    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end
    it "title should contain base title and page title" do
      visit help_path
      expect(page).to have_title(full_title('Help'))
    end
  end

  describe "About page" do
    it "should have the content 'About us'" do
      visit about_path
      expect(page).to have_content('About us')
    end
    it "title should contain base title and page title" do
      visit about_path
      expect(page).to have_title(full_title('About'))
    end
  end

  describe "Contact page" do 
    it "should have the content 'Contact us'" do
      visit contact_path
      expect(page).to have_content('Contact us')
    end
    it "title should contain base title and page title" do
      visit contact_path
      expect(page).to have_title(full_title('Contact'))
    end
  end
end
