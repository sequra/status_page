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
        allow(StatusPage).to receive(:checks).and_return(["StatusPage::MockStatus1", "StatusPage::MockStatus2"])
        status = ApplicationStatus.check
        expect(status.errors.sort).to eq ["mock error 1", "mock error 2"]
        expect(status.warnings.sort).to eq ["mock warning 1", "mock warning 2"]
      end
    end
  end
end
