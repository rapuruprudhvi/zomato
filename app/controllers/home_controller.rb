class HomeController < ApplicationController
  
  def index
  end
  def show
    @event = Event.find(params[:id])
    respond_to do |format|
      format.js
    end
  end
end
