require 'spec_helper'

# creates comment from:
# 1) users (shown on their show page)
# 2) goal (shown on that goals show page)
#

feature "when signed in" do

  before(:each) do
    sign_up_as_hello_world
    make_goal
  end

  feature "commenting on goal" do

    it "has button to add comment" do
      page.should have_content 'Comment'
      page.should have_content 'Add Comment'
    end

    it "shows shows the goal show page on submit" do
      fill_in 'Comment', with: "Great Comment!"
      click_button 'Add Comment'
      page.should have_content 'My First Goal'
    end

    it "adds the comment to the list of comments on the goal show page on submit" do
      fill_in 'Comment', with: "Great Comment!"
      click_button 'Add Comment'
      page.should have_content 'Great Comment!'
    end
  end


  feature "commenting on user" do

    before :each do
      click_link "User's Page"
    end

    it "has button to add comment" do
      page.should have_content 'Comment'
      page.should have_content 'Add Comment'
    end

    it "shows shows the user's show page on submit" do
      fill_in 'Comment', with: "Great Comment!"
      click_button 'Add Comment'
      page.should have_content 'My First Goal'
    end

    it "adds the comment to the list of comments on the user's show page on submit" do
      fill_in 'Comment', with: "Great Comment!"
      click_button 'Add Comment'
      page.should have_content 'Great Comment!'
    end
  end


end