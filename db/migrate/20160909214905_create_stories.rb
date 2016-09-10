class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :name
      t.text :description
      t.float :finalEstimation

      t.timestamps
    end
  end
end
