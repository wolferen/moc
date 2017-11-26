class SavedWeather < ApplicationRecord
  OPENWEATHER = {
    domain: "http://api.openweathermap.org",
    path: "/data/2.5/weather",
    APPID: "92fef38bd079859aea812af22a95f4de",
    units: :metric
  }.freeze

  attr_accessor :location

  belongs_to :user

  scope :reversed, -> { order('id DESC') }

  validate :location_presence

  before_save :get_weather

  private

  def get_weather
    owm_response = get_openweather
    yahoo_response = yahoo_answer

    self.yahoo_title = yahoo_response.title
    self.yahoo_temp = yahoo_response.condition.temp
    self.yahoo_text = yahoo_response.condition.text
    self.owm_min = owm_response['main']['temp_min']
    self.owm_max = owm_response['main']['temp_max']
    self.owm_cloud = owm_response['weather'][0]['description']
  end

  def yahoo_answer
    Weather.lookup_by_location("#{location}, UA",Weather::Units::CELSIUS)
  end

  def get_openweather
    params = {
      APPID: OPENWEATHER[:APPID],
      units: OPENWEATHER[:units],
      q: "#{location},UA"
    }
    http_get(OPENWEATHER[:domain], OPENWEATHER[:path], params)
  end

  def http_get(domain,path,params)
    require 'net/http'
    require 'cgi'
    response = Net::HTTP.get_response(
      URI(
        "#{domain}#{path}?".concat(
          params.collect { |k,v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&')
        )
      )
    ).body
    JSON.parse(response)
  end

  def location_presence
    errors.add(:location, 'is invalid') unless location.present?
  end
end
