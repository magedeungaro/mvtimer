class AddTimeZoneToServer < ActiveRecord::Migration[6.0]
  def change
    add_column :servers, :timezone, :string
  end
end
