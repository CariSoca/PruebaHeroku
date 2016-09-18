class AddProjectRefToEstimationSessions < ActiveRecord::Migration[5.0]
  def change
    add_reference :estimation_sessions, :project, foreign_key: true
  end
end
