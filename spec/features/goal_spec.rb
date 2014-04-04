require 'spec_helper'

feature "when signed in" do


  feature "when on the goal index page" do

    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "user1"
      fill_in 'Password', :with => "password1"
      click_on("Submit")
      click_link("Create New Goal")
      fill_in 'Title', :with => "Title"
      fill_in 'Body', :with => "BODY"
    end

    it "should not list private goals" do
      choose "Private"
      click_on "Submit"
      click_link("All Public Goals")
      expect(page).not_to have_content("Title")
    end

    it "should list public goals" do
      choose "Public"
      click_on "Submit"
      click_link("All Public Goals")
      expect(page).to have_content("Title")
    end

    # it "should not list completed goals" do
    #   click_on "Submit"
    #   expect(page).not_to have_content(completed_goal.title)
    # end

    it "each goal title is a link to it's show page" do
      choose "Public"
      click_on "Submit"
      click_link("All Public Goals")
      expect(page).to have_link("Title")
      click_on("Title")
      expect(page).to have_content("Title")
    end

  end

  feature "creating a goal" do

    before(:each) do
      visit new_user_url
      fill_in 'Username', :with => "user1"
      fill_in 'Password', :with => "password1"
      click_on("Submit")
      click_link("Create New Goal")
    end

    it "redirects to new goal page" do
      expect(page).to have_content("Create a Goal")
    end

    it "after creating goal, redirects to show page" do
      fill_in 'Title', :with => "Title"
      fill_in 'Body', :with => "BODY"
      choose "Private"
      click_on "Submit"
      expect(page).to have_content("Title")
    end

  end


  feature "when on a goal's show page" do

    feature "editing a goal" do

      it "should let the user edit his/her own goal" do
      end

      it "should not let a user edit a public goal that isn't theirs" do
      end

      it "should return the user to the goal show page after editing" do
      end
    end
  end
end

feature "when not signed in" do
  #can't do anything
end