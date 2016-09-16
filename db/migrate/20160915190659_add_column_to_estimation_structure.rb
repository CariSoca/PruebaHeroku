class AddColumnToEstimationStructure < ActiveRecord::Migration[5.0]
  def change
    add_column :estimation_structures, :numbers, :integer, array: true
  end
end
