# == Schema Information
#
# Table name: score_sheets
#
#  id            :integer         not null, primary key
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  judge_id      :integer
#  competitor_id :integer
#  score_id      :integer
#

require 'spec_helper'

describe ScoreSheet do

  	before(:each) do
    	@score_sheet = ScoreSheet.create!()
    end

    subject { @score_sheet }

    it 'should exist' do
        ScoreSheet.find(@score_sheet.id) != nil
    end

    it 'should be associated with a judge' do
        Judge.create!(:name => "Judge Judy", email: "user@example.com", password: "111111", password_confirmation: "111111", :score_sheet_id => @score_sheet.id)
        @score_sheet.judge(:force_reload=>:true) != nil
    end

    it 'should be associated with a competitor' do
        Competitor.create!(:name => "Band 1", :score_sheet_id => @score_sheet.id)
        @score_sheet.competitor(:force_reload=>:true) != nil
    end

    it 'should have a score' do
        Score.create!(:value => 5, :score_sheet_id => @score_sheet.id)
        @score_sheet.scores(:force_reload=>:true).size.should == 1
    end
end