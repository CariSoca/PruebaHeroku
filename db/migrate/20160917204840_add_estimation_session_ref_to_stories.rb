class AddEstimationSessionRefToStories < ActiveRecord::Migration[5.0]
  def change
    add_reference :stories, :estimation_session, foreign_key: true
  end
end
