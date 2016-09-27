require 'sidekiq/api'
Sidekiq::ScheduledSet.new.clear
CheckForUpdatesJob.perform_now