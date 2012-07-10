module StatusPage
  class ActiveRecordStatus < Status
    def check
      super
      begin
        ActiveRecord::Base.connection.tables
      rescue => e
        @errors << "Unable to reach database."
      end
    end
  end
end
