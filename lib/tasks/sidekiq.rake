namespace :sidekiq do
  desc "cleaning sidekiq queue"
  task clear: :environment do
    Sidekiq::Queue.all.first.clear
  end

end
