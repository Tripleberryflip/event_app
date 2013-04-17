# == Schema Information
#
# Table name: competitors
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  score_sheet_id :integer
#  event_id       :integer
#

class Competitor < ActiveRecord::Base

  attr_accessible :name, :score_sheet_id, :event_id

  scope :for_event, lambda { |e| where("event_id = ?", e.id ) }

  # Associations
  has_many :score_sheets
  belongs_to :event, :dependent => :delete
end
