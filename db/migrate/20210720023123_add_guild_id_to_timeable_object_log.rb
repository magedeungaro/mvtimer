class AddGuildIdToTimeableObjectLog < ActiveRecord::Migration[6.0]
  def change
    add_reference :timeable_object_logs, :guild, foreign_key: true
  end
end
