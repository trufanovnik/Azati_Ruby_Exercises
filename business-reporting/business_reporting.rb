require 'csv'
require 'json'
require 'pp'
require_relative "read_data.rb"
require_relative "reports.rb"
require_relative "reports_csv.rb"
require_relative "reports_json.rb"

#---------------------------------------
p ReportJSON.new.send ARGV[0].to_sym
ReportJSON.new.send ("export_"+ARGV[0]).to_sym
#---------------------------------------
p ReportCSV.new.send ARGV[0].to_sym
ReportCSV.new.send ("export_"+ARGV[0]).to_sym
#---------------------------------------
