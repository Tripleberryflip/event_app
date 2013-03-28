# == Schema Information
#
# Table name: judges
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  score_sheet_id :integer
#  event_id       :integer
#

class Judge < ActiveRecord::Base
  attr_accessible :name, :event_id, :score_sheet_id

  # Association(s)
  has_and_belongs_to_many :events#, :through => :events_judges
  belongs_to :event, :dependent => :delete

  has_many :score_sheets
  validates :name, presence: true
end


