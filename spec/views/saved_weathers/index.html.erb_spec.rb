require 'rails_helper'

RSpec.describe "saved_weathers/index", type: :view do
  before(:each) do
    assign(:saved_weathers, [
      SavedWeather.create!(
        :SavedWeather => "Saved Weather"
      ),
      SavedWeather.create!(
        :SavedWeather => "Saved Weather"
      )
    ])
  end

  it "renders a list of saved_weathers" do
    render
    assert_select "tr>td", :text => "Saved Weather".to_s, :count => 2
  end
end
