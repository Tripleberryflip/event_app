# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  text       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  max_value  :integer
#

class Question < ActiveRecord::Base
  attr_accessible :text, :max_value, :score_template_id, :score_id

  # Association(s)
  #has_and_belongs_to_many :score_templates#, :through => :
  has_many :score_templates
  has_many :scores
end


