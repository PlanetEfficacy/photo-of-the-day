require 'rails_helper'

describe "get to /photos" do
  it "returns all photos" do
    create_list :photo, count: 2
    get "/api/v1/photos"
    photo = JSON.parse(response.body)

    expect(response).to be_success
    expect(photo).to be_instance_of(Array)
    expect(photo.count).to eq(2)
    expect(photo.first["id"]).to eq(Photo.first.id)
    expect(photo.last["id"]).to eq(Photo.last.id)
  end
end
