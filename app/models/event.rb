class Event < ApplicationRecord
    attr_accessor :github_action, :issue
    belongs_to :issues, foreign_key: "issue_id", optional: true

    def initializer(github_action)
        @github_action = github_action
    end
end
