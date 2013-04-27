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
  attr_accessible :name, :event_id, :password, :password_confirmation, :email
  has_secure_password
  
  before_save { |event_coordinator| event_coordinator.email = email.downcase }
  before_save :create_remember_coordinator

  # Association(s)
  has_many :events, :dependency => :destroy
  validates :name, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  private

      def create_remember_coordinator
        self.remember_coordinator = SecureRandom.urlsafe_base64
      end
end

