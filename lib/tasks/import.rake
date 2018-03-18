require 'csv'

namespace :import do
  task :school_gas_usages => [ :environment ] do
    locations = {}
    csv_text = File.read 'public/school_gas_usage.csv'
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash
      google_geocode_url = URI.parse("http://maps.google.com/maps/api/geocode/json?address=#{row['site_name'].strip.gsub(' ', '+')}")
      locations[row['site_name']] ||= JSON.parse(Net::HTTP.get(google_geocode_url))
      binding.pry
      SchoolGasUsage.create!()
    end
  end
end
