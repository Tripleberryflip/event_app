# == Schema Information
#
# Table name: score_templates
#
#  id             :integer         not null, primary key
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  score_sheet_id :integer
#  question_id    :integer
#  event_id       :integer
#


class ScoreTemplate < ActiveRecord::Base

  attr_accessible :score_sheet_id, :question_id, :questions_attributes

  # Association(s)
  #has_and_belongs_to_many :questions#, :through => :question_score_template
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:text].blank? }, :allow_destroy => true

  has_one :event
end

