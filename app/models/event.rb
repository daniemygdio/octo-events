class Event < ApplicationRecord
    attr_accessor :github_action, :issue
    belongs_to :issues, foreign_key: "issue_id", optional: true
end
