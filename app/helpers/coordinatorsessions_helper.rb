module CoordinatorsessionsHelper
  
   def sign_in(event_coordinator)
        cookies.permanent[:remember_coordinator] = user.remember_coordinator
        self.current_coordinator = event_coordinator
    end
    
    def signed_in?
        !current_coordinator.nil?
      end
      
  def current_coordinator=(event_coordinator)
      @current_coordinator = event_coordinator
    end
    
    def current_coordinator
        @current_coordinator ||= EventCoordinator.find_by_remember_coordinator(cookies[:remember_coordinator])
      end
end
