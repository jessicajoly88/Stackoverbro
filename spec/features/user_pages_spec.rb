require 'rails_helper'

describe "the user process" do
  it "signs up a new user" do
    visit root_path
    click_link "Sign Up"
    fill_in 'Email', :with => "t@t.com"
    fill_in 'Password', :with => "peppers"
    fill_in 'Password confirmation', :with => "peppers"
    click_on "Submit"
    expect(page).to have_content 'Welcome to the site!'
  end

  it "logs in a user" do
    visit root_path
    click_link "Sign Up"
    fill_in 'Email', :with => "t@t.com"
    fill_in 'Password', :with => "peppers"
    fill_in 'Password confirmation', :with => "peppers"
    click_on "Submit"
    click_link "Log in"
    fill_in 'Email', :with => "t@t.com"
    fill_in 'Password', :with => "peppers"
    click_on "Submit"
    expect(page).to have_content 't@t.com'
  end

  it "logs out a user" do
    visit root_path
    click_link "Sign Up"
    fill_in 'Email', :with => "t@t.com"
    fill_in 'Password', :with => "peppers"
    fill_in 'Password confirmation', :with => "peppers"
    click_on "Submit"
    click_link "Log in"
    fill_in 'Email', :with => "t@t.com"
    fill_in 'Password', :with => "peppers"
    click_on "Submit"
    click_link "Log Out"
    expect(page).to have_content "You've been logged out successfully."
  end
end
