class DesignsController < ApplicationController
  before_action :set_design, only: [:show]

  def index
    if user_signed_in?
      @designs = Design.where("(public = true) or (user_id = #{current_user.id})").order(id: :desc)
    else
      @designs = Design.where('public = true').order(id: :desc)
    end
    @technologies = Technology.all
    @suggestion = Suggestion.new
    @design = Design.new
    
    respond_to do |format|
      if params[:buscador].nil?
        if user_signed_in?
          @designs = Design.where("(public = true) or (user_id = #{current_user.id})").order(id: :desc)
        else
          @designs = Design.where('public = true').order(id: :desc)
        end
          format.html
      else
          if params[:buscador].length > 3
            if user_signed_in?
            @designs = Design.where("name like ?", "%#{params[:buscador]}%").where("(public = true) or (user_id = #{current_user.id})").order(id: :desc)
            else
              @designs = Design.where("name like ?", "%#{params[:buscador]}%").where("public = true").order(id: :desc)
            end
          else
            if user_signed_in?
              @designs = Design.where("(public = true) or (user_id = #{current_user.id})").order(id: :desc)
            else
              @designs = Design.where('public = true').order(id: :desc)
            end
          end
          format.js
      end
    end
  end

  def show 
  end

  def create
    @design = Design.new(
      name: params[:design][:name],
      description: params[:design][:description],
      public: params[:public],
      user: current_user,
      file: params[:design][:file]
      )
    @design.save
    respond_to :js
  end

  private
    def set_design
      @design = Design.find(params[:id])
    end

    
end
