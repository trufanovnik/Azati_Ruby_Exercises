class ReportCSV < Reports
  def first_report
    super
    @csv_first_report.gsub(",", "  |  ")
  end

  def second_report
    super
    @column_names = [@counts].first.keys
    @csv_second_report = CSV.generate do |csv|
      csv << @column_names
      [@counts].each do |x|
        csv << x.values
      end
    end
    @csv_second_report.gsub(",", "  |  ")
  end

  def third_report
    super
    @csv_string.gsub(",", "  |  ")
  end

  def export_first_report
    File.write("first_report.csv", first_report.gsub("  |  ", ","))
  end

  def export_second_report
    File.write('second_report.csv', second_report)
  end

  def export_third_report
    File.write('third_report.csv', third_report)
  end
end
