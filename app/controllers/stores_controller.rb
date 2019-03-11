class StoresController < ApplicationController
  def index
    @stores = Store.where('active = true')
    if user_signed_in?
      @my_stores = current_user.stores 
    end
    @hash = Gmaps4rails.build_markers(@stores) do |store, marker|
      marker.lat store.latitude
      marker.lng store.longitude
    end
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
