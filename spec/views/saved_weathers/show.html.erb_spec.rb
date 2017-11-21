require 'rails_helper'

RSpec.describe "saved_weathers/show", type: :view do
  before(:each) do
    @saved_weather = assign(:saved_weather, SavedWeather.create!(
      :SavedWeather => "Saved Weather"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Saved Weather/)
  end
end
