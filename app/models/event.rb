class Event < ApplicationRecord
    attr_accessor :github_action
    belongs_to :issue, optional: true
end
