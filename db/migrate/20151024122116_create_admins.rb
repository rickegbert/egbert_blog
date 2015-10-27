class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :name
      t.string :password_digest
      t.string :auth_token

      t.timestamps null: false
    end
  end
end
