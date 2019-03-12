class PrintersController < ApplicationController

  def show
    @printer = Printer.find(params[:id])
    @store = Store.find(params[:store_id])
  end

  def create 
    @store = Store.find(params[:store_id])
    @printer = Printer.new(
      name: params[:printer][:name],
      base_price: params[:printer][:base_price],
      hour_price: params[:printer][:base_price],
      description: params[:printer][:description],
      image: params[:printer][:image],
      dimention_x: params[:printer][:dimention_x],
      dimention_y: params[:printer][:dimention_y],
      dimention_z: params[:printer][:dimention_z],
      store_id: @store.id
    )
    @printer.save
    redirect_to store_printer_path(@store, @printer)

  end

  def edit 
  end

  def update 
  end

  def destroy 
  end
end
