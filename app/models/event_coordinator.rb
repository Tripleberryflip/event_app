# == Schema Information
#
# Table name: event_coordinators
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  event_id   :integer
#

class EventCoordinator < ActiveRecord::Base
  attr_accessible :name, :event_id, :password, :password_confirmation
  has_secure_password

  # Association(s)
  belongs_to :event, :dependent => :delete
  validates :name, presence: true
  
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end

