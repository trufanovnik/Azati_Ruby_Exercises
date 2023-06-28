class ReadData
  def initialize
    @csv_data = CSV.read("assets/data.csv", headers: true)
  end
end