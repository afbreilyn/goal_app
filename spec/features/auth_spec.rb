require 'spec_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      visit new_user_url
      fill_in 'username', :with => "jonathan"
      fill_in 'password', :with => "sennacy"
      click_on "Sign Up"
    end
  end

  scenario "user uses invalid credential" do
    before(:each) do
      fill_in 'username', :with => ""
      fill_in 'password', :with => ""
      click_on "Sign Up"
    end

    it "should flash errors" do
      expect(page).to have_content "can't be blank"
    end

    it "should rerender page" do
      expect(page).to have_contect "Sign Up"
    end
  end

end

feature "logging in" do

  it "shows username on the homepage after login" do
  end

end

feature "logging out" do

  it "begins with logged out state" do
  end

  it "doesn't show username on the homepage after logout" do
  end

end