require 'csv'

namespace :import do
  task :school_gas_usages => [ :environment ] do
    SchoolGasUsage.delete_all
    locations = {}
    csv_text = File.read 'public/school_gas_usage.csv'
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash
      google_geocode_url = URI.parse("https://maps.google.com/maps/api/geocode/json?key=#{Rails.application.secrets.geocoding_api_key}&address=#{row['site_name'].strip.gsub(' ', '+')}")
      locations[row['site_name']] ||= JSON.parse(Net::HTTP.get(google_geocode_url))

      next unless locations[row['site_name']]["status"] == 'OK'

      row['latitude'] = locations[row['site_name']]["results"][0]["geometry"]['location']['lat']
      row['longitude'] = locations[row['site_name']]["results"][0]["geometry"]['location']['lng']

      SchoolGasUsage.create!(row)
    end
  end
end
