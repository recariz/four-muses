class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.integer 'sender_id', null: false
      t.integer 'receiver_id', null: false
      t.timestamps null: false
    end
    add_index :chatrooms, :sender_id
    add_index :chatrooms, :reciever_id
    add_index :chatrooms, [:sender_id, :reciever_id], unique: true
  end
end
