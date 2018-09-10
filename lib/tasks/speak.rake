namespace :speak do
  desc 'speak'
  task :run => :environment do
    users = User.all.order(:count, :id)
    user1 = users.first
    user2 = users.second
    "Today's cleaning duties are #{user1.name} and #{user2.name}.".play 'en'
    user1.update(count: user1.count+1)
    user2.update(count: user2.count+1)
  end
end
