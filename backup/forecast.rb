require 'net/https'
require 'json'
 
# Forecast API Key from https://developer.forecast.io
forecast_api_key = "1018faa3c812ba3adc77d18d1cd66002"
 
# Latitude, Longitude for location
forecast_location_lat = "33.0145673000"
forecast_location_long = "-97.0969552000"
 
# Unit Format
# "us" - U.S. Imperial
# "si" - International System of Units
# "uk" - SI w. windSpeed in mph
forecast_units = "us"
SCHEDULER.every '10m', :first_in => 0 do |job|
  http = Net::HTTP.new("api.forecast.io", 443)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  response = http.request(Net::HTTP::Get.new("/forecast/#{forecast_api_key}/#{forecast_location_lat},#{forecast_location_long}?units=#{forecast_units}"))
  forecast = JSON.parse(response.body)
  forecast_current_temp = forecast["currently"]["temperature"].round
  forecast_hour_summary = forecast["minutely"]["summary"]
  mote = { id: "SS_Temp", ftemp: "#{forecast_current_temp}&deg;F", hour: "#{forecast_hour_summary}" }
  send_event('22', { mote: mote })
end
