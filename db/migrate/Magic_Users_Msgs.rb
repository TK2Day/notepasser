class CreateUsersAndNotes < ActiveRecord::Migration
  def self.up

    create_table :users do |t|
      t.string :login, uniqueness: true
      t.string :password
    end

    create_table :msgs do |t|
      t.integer :user_id
      t.string :msgs
    end
  end



#up and down, Im still not clear on them.
  def self.down
    drop_table :users
    drop_table :msgs
  end
end
