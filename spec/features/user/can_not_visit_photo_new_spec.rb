require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "and is at the photo index page" do
    user = create :user
    stub_omniauth
    visit root_path
    click_link "Sign in with Google"
    expect(current_path).to eq(photos_path)
  end

  scenario "is redirected if attempting to visit photo new path" do
    user = create :user
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_photo_path
    expect(current_path).to eq(photos_path)
  end
end
