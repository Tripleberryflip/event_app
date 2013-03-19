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

require 'spec_helper'

describe EventCoordinator do

    before(:each) do
    	@event_coordinator = EventCoordinator.create!(name: "Lance")
    end

    subject { @event_coordinator }

    it { should respond_to(:name) }

    it 'should exist' do
       EventCoordinator.find(@event_coordinator.id).name.should == 'Lance'
    end

    it 'should belong to an event' do
       Event.create!(:name => "Sweet Event", :event_coordinator_id => @event_coordinator.id)
       @event_coordinator.event(:force_reload=>:true) != nil
    end
end

