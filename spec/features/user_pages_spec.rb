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
end
