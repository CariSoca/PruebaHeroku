class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :nickname
      t.string :image

      t.timestamps
    end
  end
end