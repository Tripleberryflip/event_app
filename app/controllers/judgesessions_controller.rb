class JudgesessionsController < ApplicationController
  def new
    end

    def create
      judge = Judge.find_by_name(params[:judgesession][:name])
          if judge && judge.authenticate(params[:judgesession][:password])
            redirect_to event_coordinator_events_path(judge.event.event_coordinator, judge.event_id)
          else
            flash.now[:error] = 'Invalid user-name/password combination' # Not quite right!
            render 'new'
          end
    end

    def destroy
      judge_sign_out
      redirect_to root_url
    end
end
