class Event < ApplicationRecord
    attr_accessor :action, :issue_id
    belongs_to :issue, class_name: "issue", foreign_key: "issue_id"
end
