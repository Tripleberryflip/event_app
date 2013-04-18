

class JudgeMailerTest < ActionMailer::TestCase
  def test_newjudge_email
      judge = Judge.create!(:name => "Judge Judy", email: "user@example.com", password: "111111", password_confirmation: "111111")

      # Send the email, then test that it got queued
      email = UserMailer.newjudge_email(judge).deliver
      assert !ActionMailer::Base.deliveries.empty?

      # Test the body of the sent email contains what we expect it to
      assert_equal [judge.email], email.to
      assert_equal "You have been selected to be a Judge!", email.subject
    end
end
