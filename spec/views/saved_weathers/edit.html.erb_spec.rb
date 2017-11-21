require 'rails_helper'

RSpec.describe "saved_weathers/edit", type: :view do
  before(:each) do
    @saved_weather = assign(:saved_weather, SavedWeather.create!(
      :SavedWeather => "MyString"
    ))
  end

  it "renders the edit saved_weather form" do
    render

    assert_select "form[action=?][method=?]", saved_weather_path(@saved_weather), "post" do

      assert_select "input[name=?]", "saved_weather[SavedWeather]"
    end
  end
end
