class Event < ApplicationRecord
    attr_accessor :action, :issue
    belongs_to :issue, foreign_key: "issue_id"
end
