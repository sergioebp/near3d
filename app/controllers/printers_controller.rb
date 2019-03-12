class PrintersController < ApplicationController

  def show
    @printer = Printer.find(params[:id])
    @store = Store.find(params[:store_id])
  end

  def new
    @printer = Printer.new
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
    @printer = Printer.find(params[:id])
    @store = Store.find(params[:store_id])
  end

  def update
    @store = Store.find(params[:store_id])
    @printer = Printer.find(params[:id])
    @printer.name = params[:printer][:name]
    @printer.base_price = params[:printer][:base_price]
    @printer.hour_price = params[:printer][:hour_price]
    @printer.description = params[:printer][:description]
    if params[:printer][:image].present?
      @printer.image = params[:printer][:image]
    end
    @printer.dimention_x = params[:printer][:dimention_x]
    @printer.dimention_y = params[:printer][:dimention_y]
    @printer.dimention_z = params[:printer][:dimention_z]
    @printer.save
    redirect_to store_printer_path(@store, @printer)
  end

  def destroy
    @printer = Printer.find(params[:id])
    @printer.destroy
    respond_to :js
  end
end
