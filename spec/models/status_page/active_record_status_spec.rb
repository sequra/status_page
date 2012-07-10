require 'spec_helper'

module StatusPage
  describe ActiveRecordStatus do
    describe "#check" do
      it "fails if we cannot perform SQL queries" do
        ActiveRecord::Base.connection.should_receive(:tables).and_raise("some error")
        ActiveRecordStatus.check.errors.should == ["Unable to reach database."]
      end
      it "succeeds otherwise" do
        status = ActiveRecordStatus.check
        status.errors.should be_empty
        status.warnings.should be_empty
      end
    end
  end
end
