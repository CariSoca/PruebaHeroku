class CreateEstimationStructures < ActiveRecord::Migration[5.0]
  def change
    create_table :estimation_structures do |t|
      t.string :name

      t.timestamps
    end
  end
end
