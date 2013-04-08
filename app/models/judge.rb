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
  attr_accessible :name, :event_id, :score_sheet_id, :password, :password_confirmation, :email
  
  has_secure_password
  
  before_save { |judge| judge.email = email.downcase }

  scope :for_event, lambda { |e| where("event_id = ?", e.id ) }

  # Association(s)
  has_and_belongs_to_many :events#, :through => :events_judges
  belongs_to :event, :dependent => :delete

  has_many :score_sheets
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
                      
end


