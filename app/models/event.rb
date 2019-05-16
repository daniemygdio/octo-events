class Event < ApplicationRecord
    belongs_to :issue, optional: true
end
