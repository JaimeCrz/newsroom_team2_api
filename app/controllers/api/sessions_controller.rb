class Api::SessionsController < ApplicationController
  def create
    lat = params[:location][:latitude].to_f
    long = params[:location][:longitude].to_f
    results = Geocoder.search([lat, long])
    edition = (results.first.address.match? /Västerås kommun|Stockholms kommun/) ? results.first.address : "Global"
    render json: {
      session: {
        location: {
          latitude: lat,
          longitude: long
        },
          edition: edition 
      } 
    }
  end
end
