class AddStoryRefToPartialEstimations < ActiveRecord::Migration[5.0]
  def change
    add_reference :partial_estimations, :story, foreign_key: true
  end
end
