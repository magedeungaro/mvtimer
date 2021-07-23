class CreateGuildTable < ActiveRecord::Migration[6.0]
  def change
    create_table :guilds do |t|
      t.string :guild_name
      t.string :description
    end
  end
end
