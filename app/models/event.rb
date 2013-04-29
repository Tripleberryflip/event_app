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

class Event < ActiveRecord::Base
  attr_accessible :name, :event_coordinator_id, :score_template_id, :judge_id, :competitor_id

  scope :for_coordinator, lambda { |coordinator| where("event_coordinator_id = ?", coordinator.id ) }

  # Association(s)
  belongs_to :event_coordinator
  belongs_to :score_template, :dependent => :destroy

  has_and_belongs_to_many :judges#, :through => :events_judges
  
  has_many :competitors, :dependent => :destroy
  has_many :score_sheets
end


