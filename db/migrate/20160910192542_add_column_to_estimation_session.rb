class AddColumnToEstimationSession < ActiveRecord::Migration[5.0]
  def change
    add_column :estimation_sessions, :strategyId, :string
  end
end
