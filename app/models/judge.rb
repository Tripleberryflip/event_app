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
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_judge
  
  before_save { |judge| judge.email = email.downcase }

  scope :for_event, lambda { |e| where("event_id = ?", e.id ) }

  # Association(s)
  has_and_belongs_to_many :events#, :through => :events_judges
  belongs_to :event

  belongs_to :score_sheet, :dependent => :destroy
  validates :name, presence: true,
                      uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  
  private

      def create_remember_judge
        self.remember_judge = SecureRandom.urlsafe_base64
      end
                      
end


