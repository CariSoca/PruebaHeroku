class CreateSessionMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :session_memberships do |t|

      t.timestamps
    end
  end
end
