class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats, &:timestamps
  end
end
