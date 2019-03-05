class DesignsController < ApplicationController
  def index
    @designs = Design.where('public = true')
    @technologies = Technology.all
    @suggestion = Suggestion.new
    @design = Design.new
  end

  def create
    @design = Design.new(
      name: params[:design][:name],
      description: params[:design][:description],
      public: params[:public],
      user: current_user
      )
    @design.save
    respond_to :js
  end
end
