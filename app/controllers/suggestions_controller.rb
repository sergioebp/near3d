class SuggestionsController < ApplicationController
    def create
        @suggestion = Suggestion.new(content: params[:suggestion][:content], user: current_user)
        @suggestion.save
        respond_to :js
    end
end
