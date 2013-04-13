class JudgesessionsController < ApplicationController
  def new
    end

    def create
      judge = Judge.find_by_email(params[:judgesession][:email].downcase)
          if judge && judge.authenticate(params[:judgesession][:password])
            judge_sign_in judge
            redirect_to judge
          else
            flash.now[:error] = 'Invalid email/password combination' # Not quite right!
            render 'new'
          end
    end

    def destroy
      judge_sign_out
      redirect_to root_url
    end
end
