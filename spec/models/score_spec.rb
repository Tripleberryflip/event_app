# == Schema Information
#
# Table name: scores
#
#  id             :integer         not null, primary key
#  value          :integer
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  question_id    :integer
#  score_sheet_id :integer
#

require 'spec_helper'

describe Score do

  	before(:each) do
    	@score = Score.create!(value: 5)
    end

    subject { @score }

    it { should respond_to(:value) }

    it 'should exist' do
        Score.find(@score.id).value.should == 5
    end

    it 'should belong to a score sheet' do
        ScoreSheet.create!(:score_id => @score.id)
        @score.score_sheet(:force_reload=>:true) != nil
    end

    it 'should belong to a question' do
    	Question.create!(:text => "How good was the act?", :max_value => 5)
    	@score.question(:force_reload=>:true) != nil
    end
end


