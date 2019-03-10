class StoresController < ApplicationController
  def index
    @stores = Store.all.where('active = true')
  end

  def show
    @store = Store.find(params[:id])
  end

  def new 
    @store = Store.new
  end

  def create
    @store = Store.new(
      name: params[:store][:name],
      description: params[:store][:description],
      address: params[:store][:address]
    )
    @store.save
    coordinates = Geocoder.coordinates(@store.address)
    @store.latitude = coordinates.first
    @store.longitude = coordinates.last
    @store.save 
    redirect_to store_path(@store)
  end
end
