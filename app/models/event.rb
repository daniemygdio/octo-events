class Event < ApplicationRecord
    belongs_to :issue, optional: true
    validates_presence_of :github_action, on: :create, message: "Action can't be blank!"
end
