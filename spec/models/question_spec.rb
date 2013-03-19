# == Schema Information
#
# Table name: questions
#
#  id         :integer         not null, primary key
#  text       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  max_value  :integer
#

require 'spec_helper'

describe Question do

    before(:each) do
        @question = Question.create!(:text=>'How was the act?', :max_value=>10)
    end

    subject { @question }

    it { should respond_to(:text) }
    it { should respond_to(:max_value) }

    it 'should exist' do
        Question.find(@question.id).text.should == 'How was the act?'
        Question.find(@question.id).max_value.should == 10
    end

    it 'should belong to a score template' do
        ScoreTemplate.create!(:question_id => @question.id)
        @question.score_templates(:force_reload=>:true) != nil
        #SQL Query= questions_score_templates: SELECT "score_templates".* FROM "score_templates" INNER JOIN "questions_score_templates" ON "score_templates"."id" = "questions_score_templates"."score_template_id" WHERE "questions_score_templates"."question_id" = 1
    end

    it 'should have score(s)' do
        Score.create!(:value => 5, :question_id => @question.id)
        @question.scores(:force_reload=>:true) != nil
    end
end