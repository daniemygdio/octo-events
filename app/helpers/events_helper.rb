module EventsHelper
    def number_of_events_by_action(events)
        events.group('github_action').count
    end
end
