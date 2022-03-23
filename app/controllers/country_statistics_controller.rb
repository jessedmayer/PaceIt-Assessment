class CountryStatisticsController < ApplicationController
  def index
    require 'net/http'

    #Check users IP for country_iso then save it to VisitorsByCountry
    source = 'https://ifconfig.co/json'
    response = Net::HTTP.get_response(URI.parse(source))
    data = response.body
    result = JSON.parse(data)
    user_country_iso = result["country_iso"]

    country = VisitorsByCountry.find_by(country_iso: user_country_iso)
    if country.nil?
      #Create new entry in VisitorsByCountry for new country_iso
      country = VisitorsByCountry.new(country_iso: user_country_iso, visitors: 1)
      country.save
    else
      #Increment visits for country_iso
      country.update(visitors: country.visitors + 1)
    end

    #Load all visitors by country to display
    @country_statistics = VisitorsByCountry.all
  end
end
