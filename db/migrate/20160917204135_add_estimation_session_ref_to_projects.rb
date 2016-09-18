class AddEstimationSessionRefToProjects < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :estimation_session, foreign_key: true
  end
end
