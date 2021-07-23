class CreateGuildMemberTypeTable < ActiveRecord::Migration[6.0]
  def change
    create_table :guild_member_types do |t|
      t.string :description
    end
  end
end
