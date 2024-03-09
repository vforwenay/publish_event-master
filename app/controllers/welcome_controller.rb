class WelcomeController < ApplicationController
  def index
    @events = Event.paginate(page: params[:page], per_page: 9)
    render 'events/index'
  end
end
