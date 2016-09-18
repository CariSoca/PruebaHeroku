class AddUserRefToSessionMemberships < ActiveRecord::Migration[5.0]
  def change
    add_reference :session_memberships, :user, foreign_key: true
  end
end
