require 'spec_helper'
require 'rake'

describe "rake" do

  before do
    Rake.application = Rake::Application.new
    load Rails.root + 'lib/tasks/mail.rake'

    
    Rake::Task.define_task(:environment)

    
    ActionMailer::Base.deliveries = []
  end

  describe "task mail:projectstatus" do

    it "should have 'environment' as a prerequisite" do
      expect(Rake::Task['mail:projectstatus'].prerequisites).to include("environment")
    end

    it "sends the right number of emails" do
      2.times { FactoryGirl.create :project }

      expect(Project.all.count).to be(2) 

      Rake::Task['mail:projectstatus'].invoke

      expect(ActionMailer::Base.deliveries.length).to be(2)
    end
  end
end