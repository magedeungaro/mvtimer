class AddTimezoneToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :timezone, :datetime
  end
end
