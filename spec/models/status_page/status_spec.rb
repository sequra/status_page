require 'spec_helper'

module StatusPage
  describe Status do
    describe ".check" do
      it "returns a Status object" do
        expect(Status.check).to be_a Status
      end

      it "the Status object has run all checks" do
        status = Status.new
        allow(status).to receive(:errors).and_return(["I've made a huge mistake"])
        allow(Status).to receive(:new).and_return(status)
        expect(status).to receive(:check)
        expect(Status.check.errors).to eq ["I've made a huge mistake"]
      end
    end

    describe "#one_word_summary" do
      it "returns OK if there is no errors and warnings" do
        status = Status.new
        allow(status).to receive(:warnings).and_return([])
        allow(status).to receive(:errors).and_return([])
        expect(status.one_word_summary).to eq "OK"
      end
      it "returns Error if there is both errors and warnings" do
        status = Status.new
        allow(status).to receive(:warnings).and_return(["warning"])
        allow(status).to receive(:errors).and_return(["error"])
        expect(status.one_word_summary).to eq "Error"
      end
      it "returns Warning if there is only warnings" do
        status = Status.new
        allow(status).to receive(:warnings).and_return(["warning"])
        allow(status).to receive(:errors).and_return([])
        expect(status.one_word_summary).to eq "Warning"
      end
    end
  end
end
