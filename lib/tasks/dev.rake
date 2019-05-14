require 'tty-spinner'
namespace :dev do
  desc "Setup development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Dropping database") { %x(rails db:drop) }
      show_spinner("Creating database") { %x(rails db:create) }
      show_spinner("Migrating") { %x(rails db:migrate) }
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
end
 
