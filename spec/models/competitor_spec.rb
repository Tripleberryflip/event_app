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

require 'spec_helper'

describe Competitor do

    before(:each) do
    	@competitor = Competitor.create!(name: "Some Competitor")
    end

    subject { @competitor }

    it { should respond_to(:name) }

    it 'should exist' do
       Competitor.find(@competitor.id).name.should == 'Some Competitor'
    end

    it 'should belong to an event' do
        Event.create!(:name=>"Some Event", :competitor_id => @competitor.id)
        @competitor.event(:force_reload=>:true) != nil
    end

    it 'should have a score_sheet' do
    	ScoreSheet.create!(:competitor_id => @competitor.id)
    	@competitor.score_sheets(:force_reload=>:true) != nil
    end
end
