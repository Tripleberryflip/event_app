# == Schema Information
#
# Table name: score_sheets
#
#  id            :integer         not null, primary key
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  judge_id      :integer
#  competitor_id :integer
#  score_id      :integer
#

class ScoreSheet < ActiveRecord::Base
	attr_accessible :score_id, :judge_id, :competitor_id

	# Association(s)
	has_many :scores
	belongs_to :judge
	belongs_to :competitor
end


