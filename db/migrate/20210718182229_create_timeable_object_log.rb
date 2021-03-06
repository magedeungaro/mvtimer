class CreateTimeableObjectLog < ActiveRecord::Migration[6.0]
  def change
    create_table :timeable_object_logs do |t|
      t.string :description
      t.references :server, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :timeable_object, null: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
