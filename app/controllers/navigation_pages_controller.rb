class NavigationPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def results
    @event = Event.find(params[:id])
    
     respond_to do |format|
        format.html { redirect_to results_path(@event) }
      end
  end
end
