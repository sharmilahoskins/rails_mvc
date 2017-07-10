require 'rails_helper'

RSpec.feature "RegisterUsers", type: :feature do
  context "Landing page" do
    Steps "Going to Landing page" do
      Given "I visit localhost 3000:" do
        visit "/"
      end
      Then "I see Welcome!" do
        expect(page).to have_content("Welcome!")
      end
    end
  end
  context "Register a user" do
    Steps "for registering a user" do
      Given "that I am on the registering page" do
        visit "users/register"
      end
       Then "I can enter my information" do
        fill_in 'fullname', with: 'Don Ready'
        fill_in 'email', with: 'DonReady@hotmail.com'
        click_button 'Register'
       end
      Then 'I am taken to a page that shows that I am registered.' do
        expect(page).to have_content 'Don Ready'
        expect(page).to have_content 'DonReady@hotmail.com'
      end
    end
  end
end
