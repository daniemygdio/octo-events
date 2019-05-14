class Event < ApplicationRecord
    attr_accessor :action
    belongs_to :issue, class_name: "issue", foreign_key: "issue_id"
end
