class CreatePartialEstimations < ActiveRecord::Migration[5.0]
  def change
    create_table :partial_estimations do |t|
      t.float :estimation

      t.timestamps
    end
  end
end
