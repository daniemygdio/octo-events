require 'tty-spinner'
namespace :dev do
  desc "Setup development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping database") { %x(rails db:drop) }
      show_spinner("Creating database") { %x(rails db:create) }
      show_spinner("Migrating") { %x(rails db:migrate) }
      show_spinner("Seeding issues") { %x(rails dev:add_issues) }
      show_spinner("Seeding events") { %x(rails dev:add_events) }
    else
      puts "Not in the development mode!"
    end
  end

  def show_spinner(task)
    spinner = TTY::Spinner.new("[:spinner] #{task} ...", format: :pulse_2)
      spinner.auto_spin # Automatic animation with default interval
      yield
      spinner.success('(successful)')
  end

  desc "Add dummy issues to the database"
  task add_issues: :environment do
    issues = [
      {
        url: "http://www.example.com/1",
        number: 1
      },
      {
        url: "http://www.example.com/2",
        number: 2
      },{
        url: "http://www.example.com/3",
        number: 3
      }
    ]

    issues.each do |issue|
      Issue.find_or_create_by!(issue)
    end
  end

  desc "Add dummy events to the database"
  task add_events: :environment do
    events = [
      {
        action: "opened",
        issue: Issue.all.sample
      },
      {
        action: "closed",
        issue: Issue.all.sample
      },
      {
        action: "opened",
        issue: Issue.all.sample
      }
    ]

    events.each do |event|
      Event.find_or_create_by!(event)
    end
  end
end
 
