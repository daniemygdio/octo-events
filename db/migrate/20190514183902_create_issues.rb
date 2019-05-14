class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :url
      t.integer :number

      t.timestamps
    end
  end
end
