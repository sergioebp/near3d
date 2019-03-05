class DesignsController < ApplicationController
  def index
    @designs = Design.where('public = false')
    @technologies = Technology.all
  end
end
