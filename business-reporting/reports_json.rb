class ReportJSON < Reports
  def first_report
    super
    parsed_data = CSV.parse(@csv_first_report)
    @json_data = parsed_data.to_json
  end

  def second_report
    super
    @counts.to_json
  end

  def third_report
    super
  end

  def export_first_report
    File.open('first_report.json', 'w') do |file|
      file.puts JSON.pretty_generate(first_report)
    end
  end

  def export_second_report
    File.open('second_report.json', 'w') do |file|
      file.puts JSON.pretty_generate(second_report)
    end
  end

  def export_third_report
    File.open('third_report.json', 'w') do |file|
      file.puts JSON.pretty_generate(third_report)
    end
  end
end
