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
       EventCoordinator.find(@event_coordinator.id).email.should == 'user@example.com'
       EventCoordinator.find(@event_coordinator.id).password == '111111'
       EventCoordinator.find(@event_coordinator.id).password_confirmation == '111111'
     end

    it 'should belong to an event' do
       Event.create!(:name => "Sweet Event", :event_coordinator_id => @event_coordinator.id)
       @event_coordinator.event_id != nil
    end
    
    describe "when name is not present" do
      before { @event_coordinator.name = " " }
      it { should_not be_valid }
    end

    describe "when email is not present" do
      before { @event_coordinator.email = " " }
      it { should_not be_valid }
    end
    
    describe "when email format is valid" do
      it "should be valid" do
        addresses = %w[user@foo.COM A_US-ER@f.b.org first.lst@foo.jp a+b@baz.cn]
        addresses.each do |valid_address|
          @event_coordinator.email = valid_address
          @event_coordinator.should be_valid
        end
      end
    end
end

