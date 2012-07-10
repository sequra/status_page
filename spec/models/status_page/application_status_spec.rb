require 'spec_helper'

module StatusPage

  class MockStatus1 < Status
    def check
      @errors << "mock error 1"
      @warnings << "mock warning 1"
    end
  end
  class MockStatus2 < Status
    def check
      @errors << "mock error 2"
      @warnings << "mock warning 2"
    end
  end

  describe ApplicationStatus do
    describe "#check" do
      it "runs checks for all classes registered in StatusPage.checks" do
        StatusPage.stub!(:checks).and_return(["StatusPage::MockStatus1", "StatusPage::MockStatus2"])
        status = ApplicationStatus.check
        status.errors.sort.should == ["mock error 1", "mock error 2"]
        status.warnings.sort.should == ["mock warning 1", "mock warning 2"]
      end
    end
  end
end
