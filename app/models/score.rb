# == Schema Information
#
# Table name: scores
#
#  id             :integer         not null, primary key
#  value          :integer
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  question_id    :integer
#  score_sheet_id :integer
#


class Score < ActiveRecord::Base
  attr_accessible :value, :score_sheet_id, :question_id

  # Association
  belongs_to :score_sheet
  belongs_to :question

end

