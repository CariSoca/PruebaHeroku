class CreateEstimationSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :estimation_sessions do |t|
      t.string :title
      t.text :description
      t.string :sharedLink
      t.boolean :synchronous
      t.timestamp :beginningTime
      t.timestamp :endTime
      t.timestamp :realTime

      t.timestamps
    end
  end
end
