class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :github_action
      
      t.timestamps
    end
  end
end
