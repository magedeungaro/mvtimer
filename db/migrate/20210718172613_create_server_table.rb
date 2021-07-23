class CreateServerTable < ActiveRecord::Migration[6.0]
  def change
    create_table :servers do |t|
      t.string :description
    end
  end
end
