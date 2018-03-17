require 'csv'

namespace :import do
  task :school_gas_usage => [ :environment ] do
    csv_text = File.read 'public/school_gas_usage.csv'
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      SchoolGasUsage.create!(row.to_hash)
    end
  end
end
