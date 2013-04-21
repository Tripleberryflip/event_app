class JudgeMailer < ActionMailer::Base
  default from: "tripleberryflip@gmail.com"
  
  def newjudge_email(judge)
    @judge = judge
    @url = "http://event-judging-application.herokuapp.com/"
    mail(:to => judge.email, :subject => "You have been selected to be a Judge!")
  end
end
