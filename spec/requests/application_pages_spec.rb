require 'spec_helper'

describe "Application Pages" do

    describe "Navigation Bar" do

      it "should have the h1 'Event App' logo" do
        visit 'navigation_pages/home' 
        page.should have_selector('img', :src => '/assets/judgment.png')
      end
  end

    describe "Home page" do

      it "should have the title 'Home'" do
        visit 'navigation_pages/home'
        page.should have_selector('title', :text => "Event Application | Home")
      end

      it "should have the h1 'Welcome to the Event Application'" do
        visit 'navigation_pages/home'
        page.should have_selector('h1', :text => "Welcome to the Event Application")
      end
    end
end
