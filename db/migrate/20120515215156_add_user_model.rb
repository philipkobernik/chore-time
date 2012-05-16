class AddUserModel < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :provider
      t.string :uid
      t.string :email
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
