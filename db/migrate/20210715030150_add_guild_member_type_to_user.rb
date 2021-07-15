class AddGuildMemberTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :guild_member_type, null: false, foreign_key: true
  end
end
