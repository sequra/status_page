require 'spec_helper'

module StatusPage
  describe Status do
    describe ".check" do
      it "returns a Status object" do
        Status.check.should be_a Status
      end

      it "the Status object has run all checks" do
        status = Status.new
        status.stub(:errors).and_return(["I've made a huge mistake"])
        Status.stub(:new).and_return(status)
        status.should_receive(:check)
        Status.check.errors.should == ["I've made a huge mistake"]
      end
    end

    describe "#one_word_summary" do
      it "returns OK if there is no errors and warnings" do
        status = Status.new
        status.stub(:warnings).and_return([])
        status.stub(:errors).and_return([])
        status.one_word_summary.should == "OK"
      end
      it "returns Error if there is both errors and warnings" do
        status = Status.new
        status.stub(:warnings).and_return(["warning"])
        status.stub(:errors).and_return(["error"])
        status.one_word_summary.should == "Error"
      end
      it "returns Warning if there is only warnings" do
        status = Status.new
        status.stub(:warnings).and_return(["warning"])
        status.stub(:errors).and_return([])
        status.one_word_summary.should == "Warning"
      end
    end
  end
end
