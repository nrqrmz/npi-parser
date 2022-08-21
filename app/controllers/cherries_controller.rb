class CherriesController < ApplicationController
  def index
    @cherries = Cherry.all
    @cherry = Cherry.new
  end

  def new
  end

  def create
    require 'json'
    require 'open-uri'

    npi = strong_params[:npi]
    # url = "https://npiregistry.cms.hhs.gov/api/?version=2.0&number=1972951945"
    url = "https://npiregistry.cms.hhs.gov/api/?version=2.0&number=#{npi}"
    doc = JSON.parse(URI.open(url).read)['results'][0]
    @cherry = Cherry.new(
      name: doc['basic']['first_name'],
      address: doc['addresses'][0]['address_1'],
      city: doc['addresses'][0]['city'],
      state: doc['addresses'][0]['state']
    )
    @cherry.save
    redirect_to cherries_path
  end



  private

  def strong_params
    params.require(:cherry).permit(:npi)
  end
end
