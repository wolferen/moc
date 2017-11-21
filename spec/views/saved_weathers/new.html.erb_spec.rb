require 'rails_helper'

RSpec.describe "saved_weathers/new", type: :view do
  before(:each) do
    assign(:saved_weather, SavedWeather.new(
      :SavedWeather => "MyString"
    ))
  end

  it "renders new saved_weather form" do
    render

    assert_select "form[action=?][method=?]", saved_weathers_path, "post" do

      assert_select "input[name=?]", "saved_weather[SavedWeather]"
    end
  end
end
