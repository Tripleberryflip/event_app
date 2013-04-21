module JudgesessionsHelper
  
  def judge_sign_in(judges)
    cookies.permanent[:remember_judge] = judges.remember_judge
    self.current_judge = judges
  end
    
  def judge_signed_in?
    !current_judge.nil?
  end
      
  def current_judge=(judge)
    @current_judge = judge
  end
    
  def current_judge
    @judge ||= Judge.find_by_remember_judge(cookies[:remember_judge])
  end
      
  def judge_sign_out
    self.current_judge = nil
    cookies.delete(:remember_judge)
  end
end
