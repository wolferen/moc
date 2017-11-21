require 'test_helper'

class SavedWeathersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @saved_weather = saved_weathers(:one)
  end

  test "should get index" do
    get saved_weathers_url
    assert_response :success
  end

  test "should get new" do
    get new_saved_weather_url
    assert_response :success
  end

  test "should create saved_weather" do
    assert_difference('SavedWeather.count') do
      post saved_weathers_url, params: { saved_weather: { yahoo_title: @saved_weather.yahoo_title } }
    end

    assert_redirected_to saved_weather_url(SavedWeather.last)
  end

  test "should show saved_weather" do
    get saved_weather_url(@saved_weather)
    assert_response :success
  end

  test "should get edit" do
    get edit_saved_weather_url(@saved_weather)
    assert_response :success
  end

  test "should update saved_weather" do
    patch saved_weather_url(@saved_weather), params: { saved_weather: { yahoo_title: @saved_weather.yahoo_title } }
    assert_redirected_to saved_weather_url(@saved_weather)
  end

  test "should destroy saved_weather" do
    assert_difference('SavedWeather.count', -1) do
      delete saved_weather_url(@saved_weather)
    end

    assert_redirected_to saved_weathers_url
  end
end
