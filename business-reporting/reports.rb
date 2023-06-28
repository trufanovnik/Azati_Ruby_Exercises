class Reports < ReadData
  attr_accessor :csv_data

  def first_report
    @filtered_data_first_report = []
    @filtered_data_first_report << @csv_data.headers
    @csv_data.each do |row|
      if row["workers"].to_i > 100
        @filtered_data_first_report << row
      end
    end
    @csv_first_report = @filtered_data_first_report.map(&:to_csv).join
  end

  def second_report
    groups = @csv_data.group_by { |row| row["industry"] }
    counts = groups.map {|industry, rows| [industry, rows.size]}
    @counts = counts.to_h
  end

  def third_report
    csv_headers = @csv_data.headers
    ny_data = @csv_data.select {|row| row["state_s"] == "NY"}
    ny_data = ny_data.sort_by {|row| row["revenue"].to_f}
    @combined_data = [csv_headers] + ny_data.take(10)
    @csv_string = CSV.generate do |csv|
      @combined_data.each do |row|
           csv << row
      end
    end
  end
end