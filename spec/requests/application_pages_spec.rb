require 'spec_helper'

describe "Application Pages" do

    describe "Navigation Bar" do

      it "should have the h1 'Event App' logo" do
        visit root_path 
        page.should have_selector('img', :src => '/assets/judgment.png')
      end

      it "should have an event_coordinator registration link" do
        visit root_path 
        page.should have_link('Register to be an event coordinator and get started', href: signupcoordinator_path)
      end

      it "should have an event_coordinator sign in link" do
        visit root_path
        page.should have_link('Sign in as event coordinator', href: coordinatorsignin_path)
      end

      it "should have a judge sign in link" do
        visit root_path 
        page.should have_link('Sign in as a judge', href: judgesignin_path)
      end
    end

    describe "Home page" do

      it "should have the title 'Home'" do
        visit root_path
        page.should have_selector('title', :text => "Event Application | Home")
      end

      it "should have the h1 'Welcome to the Event Application'" do
        visit root_path
        page.should have_selector('h1', :text => "Welcome to the Event Application")
      end
    end
end
