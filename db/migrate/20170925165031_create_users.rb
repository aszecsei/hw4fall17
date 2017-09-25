class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :email
      t.string :session_token
      # Add fields that let Rails automatically keep track
      # of when users are added or modified:
      t.timestamps
    end
  end
end
