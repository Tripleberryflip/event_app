# == Schema Information
#
# Table name: score_templates
#
#  id             :integer         not null, primary key
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  question_id    :integer
#  event_id       :integer
#

require 'spec_helper'

describe ScoreTemplate do

  	before(:each) do
    	@score_template = ScoreTemplate.create!()
    end

    subject { @score_template }

    it { should respond_to() }

    it 'should exist' do
        ScoreTemplate.find(@score_template.id) != nil
    end

    it 'should be belong to an event' do
        Event.create!(:name=>'Some Big Event', :score_template_id => @score_template.id)
        @score_template.event(:force_reload=>:true).size.should == 1
    end

    it 'should have and belong to many questions' do
    	Question.create!(:text => "How good was the act?", :max_value => 5)
        Question.create!(:text => 'How was their stage presence?', :max_value => 8)
        # SQL Query = questions_score_templates: SELECT "questions".* FROM "questions" INNER JOIN "questions_score_templates" ON "questions"."id" = "questions_score_templates"."questions_id" WHERE "questions_score_templates"."score_template_id" = 1
    end
end