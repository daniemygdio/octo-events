class AddIssueRefToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :issue, foreign_key: true
  end
end