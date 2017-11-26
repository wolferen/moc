class SavedWeathersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_saved_weather, only: %i[destroy]

  def index
    @saved_weathers = current_user.saved_weathers.reversed
  end

  def create
    @saved_weather = current_user.saved_weathers.create(saved_weather_params)

    respond_to :js
  end

  def destroy
    @saved_weather.destroy

    respond_to :js
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_saved_weather
    @saved_weather = current_user.saved_weathers.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def saved_weather_params
    params.require(:saved_weather).permit(:location)
  end
end
