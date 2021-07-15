class CreateTimeableObjectsLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :timeable_objects_logs do |t|
      t.references :timeable_object, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :server, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
