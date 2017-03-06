require 'spec_helper'

module StatusPage
  describe ActiveRecordStatus do
    describe "#check" do
      it "fails if we cannot perform SQL queries" do
        expect(ActiveRecord::Base.connection).to receive(:tables).and_raise("some error")
        expect(ActiveRecordStatus.check.errors).to eq ["Unable to reach database."]
      end
      it "succeeds otherwise" do
        status = ActiveRecordStatus.check
        expect(status.errors).to be_empty
        expect(status.warnings).to be_empty
      end
    end
  end
end
