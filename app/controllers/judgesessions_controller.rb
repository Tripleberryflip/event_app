class JudgesessionsController < ApplicationController
  
  def index
    redirect_to current_judge
  end
  
  def new
    end

    def create
      judge = Judge.find_by_name(params[:judgesession][:name])
          if judge && judge.authenticate(params[:judgesession][:password])
            judge_sign_in judge
            redirect_to judge
          else
            flash.now[:error] = 'Invalid user-name/password combination' 
            render 'new'
          end
    end

    def destroy
      judge_sign_out
      redirect_to root_url
    end
end
