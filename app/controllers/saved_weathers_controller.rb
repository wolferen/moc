class SavedWeathersController < ApplicationController
  before_action :set_saved_weather, only: %i[show edit update destroy]

  # GET /saved_weathers
  # GET /saved_weathers.json
  def index
    # binding.pry
    if params[:thing].present?
      @location = params[:thing][:search_city]
      yahoo_response = Weather.lookup_by_location("#{@location}, UA",
                                                  Weather::Units::CELSIUS)
      owm_response = JSON.load(open("http://api.openweathermap.org/data/2.5/weather?q=
                                      #{@location},UA&units=metric&APPID=92fef38bd079859aea812af22a95f4de"))
      SavedWeather.create!(yahoo_title: yahoo_response.title,
                           yahoo_temp: yahoo_response.condition.temp,
                           yahoo_text: yahoo_response.condition.text,
                           owm_min: owm_response['main']['temp_min'],
                           owm_max: owm_response['main']['temp_max'],
                           owm_cloud: owm_response['weather'][0]['description'])
    end
    @saved_weathers = SavedWeather.all
  end

  # GET /saved_weathers/1
  # GET /saved_weathers/1.json
  def show; end

  # GET /saved_weathers/new
  def new
    @saved_weather = SavedWeather.new
  end

  # GET /saved_weathers/1/edit
  def edit; end

  # POST /saved_weathers
  # POST /saved_weathers.json
  def create
    @saved_weather = SavedWeather.new(saved_weather_params)
    respond_to do |format|
      if @saved_weather.save
        format.html { redirect_to @saved_weather, notice: 'Saved weather was successfully created.' }
        format.json { render :show, status: :created, location: @saved_weather }
      else
        format.html { render :new }
        format.json { render json: @saved_weather.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saved_weathers/1
  # PATCH/PUT /saved_weathers/1.json
  def update
    respond_to do |format|
      if @saved_weather.update(saved_weather_params)
        format.html { redirect_to @saved_weather, notice: 'Saved weather was successfully updated.' }
        format.json { render :show, status: :ok, location: @saved_weather }
      else
        format.html { render :edit }
        format.json { render json: @saved_weather.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saved_weathers/1
  # DELETE /saved_weathers/1.json
  def destroy
    @saved_weather.destroy
    respond_to do |format|
      format.html { redirect_to saved_weathers_url, notice: 'Saved weather was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_saved_weather
    @saved_weather = SavedWeather.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def saved_weather_params
    params.require(:saved_weather).permit(:yahoo_title, :yahoo_temp,
                                          :yahoo_text, :owm_max, :owm_min,
                                          :owm_cloud)
  end
end
