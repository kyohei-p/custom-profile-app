class AddDeletedAtToSkills < ActiveRecord::Migration[7.0]
  def change
    add_column :skills, :deleted_at, :datetime
    add_index :skills, :deleted_at
  end
end
