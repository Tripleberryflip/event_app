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
    	@event_coordinator = EventCoordinator.create!(name: "Lance", email: "user@example.com", password: "111111", password_confirmation: "111111")
    end

    subject { @event_coordinator }

    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }

    it 'should exist' do
       EventCoordinator.find(@event_coordinator.id).name.should == 'Lance'
<<<<<<< HEAD
       EventCoordinator.find(@event_coordinator.id).email.should == 'user@example.com'
       EventCoordinator.find(@event_coordinator.id).password == '111111'
       EventCoordinator.find(@event_coordinator.id).password_confirmation == '111111'
=======
    end
    
    it 'should exist' do
      EventCoordinator.find(@event_coordinator.id).email.should == 'user@example.com'
>>>>>>> ad793ec346cf4cc6a5566ee0aaea455efb333b6b
    end

    it 'should belong to an event' do
       Event.create!(:name => "Sweet Event", :event_coordinator_id => @event_coordinator.id)
<<<<<<< HEAD
=======
       @event_coordinator.event_id != nil
>>>>>>> ad793ec346cf4cc6a5566ee0aaea455efb333b6b
    end
end

