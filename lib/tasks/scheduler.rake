desc "This task is called by the Heroku scheduler add-on"

task remove_excessive_comments: :environment do
  puts "Removing excessive comments now..."
  Comment.remove_excessive!
end