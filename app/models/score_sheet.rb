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

	scope :current, lambda  { |event_id, judge_id, competitor_id|
  	where("event_id = :event_id and judge_id = :judge_id and competitor_id = :competitor_id",
  		{ event_id: event_id, judge_id: judge_id, competitor_id: competitor_id })
  	}

	attr_accessible :judge_id, :competitor_id, :score_template, :scores_attributes

	scope :for_judge, lambda { |j| where("judge_id = ?", j.id ) }

	# Association(s)
	has_many :scores, :dependent => :destroy
	belongs_to :event
	belongs_to :judge
	belongs_to :competitor
	belongs_to :score_template
	
	accepts_nested_attributes_for :scores
end




