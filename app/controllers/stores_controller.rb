class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

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
    @my_store = @store.users.where("user_id = #{current_user.id}").present?
    @admin_users = @store.users
    @printer = Printer.new
    @printers = @store.printers
  end

  def new 
    @store = Store.new
  end

  def create
    @store = Store.new(
      name: params[:store][:name],
      description: params[:store][:description],
      address: params[:store][:address],
      active: params[:active],
      latitude: params[:store][:latitude],
      longitude: params[:store][:longitude]
    )
    @store.save
    if @store.latitude.nil? || @store.longitude.nil?
      coordinates = Geocoder.coordinates(@store.address)
      @store.latitude = coordinates.first
      @store.longitude = coordinates.last
      @store.save
    end
    @store.users << current_user
    @store.save
    if current_user.role == 'client'
      current_user.role = 1
      current_user.save
    end
    redirect_to store_path(@store)
  end

  def edit
  end

  def update
    @store.name = params[:store][:name]
    @store.description = params[:store][:description]
    @store.address = params[:store][:address]
    @store.active = params[:active]
    @store.latitude = params[:store][:latitude]
    @store.longitude = params[:store][:longitude]
    @store.save
    if @store.latitude.nil? || @store.longitude.nil?
      coordinates = Geocoder.coordinates(@store.address)
      @store.latitude = coordinates.first
      @store.longitude = coordinates.last
      @store.save
    end
    redirect_to store_path(@store)
  end

  def destroy
    @store.destroy
    if !(current_user.stores.present?) && current_user.role == 'vendor'
      current_user.role = 0
      current_user.save
    end
    redirect_to stores_path
  end

  def add_vendor
    @store = Store.find(params[:id])
    new_vendor = User.find(params[:userid])
    @store.users << new_vendor
    @store.save
    if new_vendor.role == 0
      new_vendor.role = 1
      new_vendor.save
    end 
    redirect_to store_path(@store)
  end



  private
    def set_store
      @store = Store.find(params[:id])
    end
end
