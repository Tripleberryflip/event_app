require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
# == Schema Information
#
# Table name: events
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  event_coordinator_id :integer
#  score_template_id    :integer
#  judge_id             :integer
#  competitor_id        :integer
#

