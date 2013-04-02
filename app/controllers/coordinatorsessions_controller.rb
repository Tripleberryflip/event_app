class CoordinatorsessionsController < ApplicationController
  
  def new
    end

    def create
      event_coordinator = EventCoordinator.find_by_email(params[:coordinatorsession][:email].downcase)
          if event_coordinator && event_coordinator.authenticate(params[:coordinatorsession][:password])
            sign_in event_coordinator
            redirect_to event_coordinator
          else
            flash.now[:error] = 'Invalid email/password combination' # Not quite right!
            render 'new'
          end
    end

    def destroy
    end
  
end
