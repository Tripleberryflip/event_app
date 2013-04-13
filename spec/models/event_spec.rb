# == Schema Information
#
# Table name: events
#
#  id                   :integer         not null, primary key
#  name                 :string(255)
#  created_at           :datetime        not null
#  updated_at           :datetime        not null
#  event_coordinator_id :integer
#  score_template_id    :integer
#  judge_id             :integer
#  competitor_id        :integer
#

require 'spec_helper'

describe Event do

    before(:each) do
    	@event = Event.create!(name: "Sweet Event")
    end

    subject { @event }

    it { should respond_to(:name) }

    it 'should exist' do
       Event.find(@event.id).name.should == 'Sweet Event'
    end

    it 'should have an event coordinator' do
    	EventCoordinator.create!(:name => "Lance", email: "user@example.com", password: "111111", password_confirmation: "111111", :event_id => @event.id)
    	@event.event_coordinator(:force_reload=>:true) != nil
    end

    it 'should have a score template' do
        ScoreTemplate.create!(:event_id => @event.id)
        @event.score_template(:force_reload=>:true) != nil
    end

    it 'should have a judge' do
        Judge.create!(:name => "Judge Judy", email: "user@example.com", password: "111111", password_confirmation: "111111", :event_id => @event.id)
        @event.judges(:force_reload=>:true) != nil
        # SQL Query= events_judges: SELECT "judges".* FROM "judges" INNER JOIN "events_judges" ON "judges"."id" = "events_judges"."judge_id" WHERE "events_judges"."event_id" = 1
    end

    it 'should have multiple competitors' do
        Competitor.create!(:name => "Band 1", :event_id => @event.id)
        Competitor.create!(:name => "Band 2", :event_id => @event.id)
        @event.competitors(:force_reload=>:true).size.should == 2
    end

    it 'should delete the coordinator when the event is deleted' do
        coordinator = EventCoordinator.create!(:name=>"Lance", email: "user@example.com", password: "111111", password_confirmation: "111111", :event_id => @event.id)
        @event.delete
    end

    it 'should delete the score_template when the event is deleted' do
        template = ScoreTemplate.create!(:event_id => @event.id)
        @event.delete
        template.event(:force_reload=>:true) == nil
    end

    it 'should delete the judge when the event is deleted' do
        judge = Judge.create!(:name => "Judge Judy", email: "user@example.com", password: "111111", password_confirmation: "111111", :event_id => @event.id)
        @event.delete
        judge.event(:force_reload=>:true) == nil
    end

    it 'should delete the competitors when the event is deleted' do
        c1 = Competitor.create!(:name => "Band 1", :event_id => @event.id)
        c2 = Competitor.create!(:name => "Band 2", :event_id => @event.id)
        @event.delete
        c1.event(:force_reload=>:true) == nil
        c2.event(:force_reload=>:true) == nil
    end
end


