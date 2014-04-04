require 'spec_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      visit new_user_url
      fill_in 'Username', :with => "jonathan"
      fill_in 'Password', :with => "sennacy"
      click_on "Sign Up"
    end
  end

  feature "user uses invalid credential" do
    #user = FactoryGirl.build(:user, :username => "", :password => "" )

    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => ""
      fill_in 'Password', :with => ""
      click_on "Submit"
    end

    it "shouldn't let username be blank" do
      expect(page).to have_content "Username can't be blank"
    end

    it "shouldn't let password be less than 6 characters" do
      expect(page).to have_content "Password is too short"
    end

    it "should rerender page" do
      expect(page).to have_content "Sign Up"
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