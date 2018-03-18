class AddLatLongToSchoolGasUsage < ActiveRecord::Migration[5.1]
  def change
    add_column :school_gas_usages, :latitude, :string
    add_column :school_gas_usages, :longitude, :string
  end
end
