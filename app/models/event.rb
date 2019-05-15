class Event < ApplicationRecord
    attr_accessor :github_action, :issue
    belongs_to :issue, foreign_key: "issue_id"
end
