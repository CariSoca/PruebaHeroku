class AddEstimationSessionRefToSessionMemberships < ActiveRecord::Migration[5.0]
  def change
    add_reference :session_memberships, :estimation_session, foreign_key: true
  end
end
