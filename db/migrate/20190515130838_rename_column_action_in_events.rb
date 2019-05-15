class RenameColumnActionInEvents < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :action, :github_action
  end
end
