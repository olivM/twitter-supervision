task :cron => :environment do
  
  Tweet.convert_all
  
 if Time.now.hour % 4 == 0 # run every four hours
   #NewsFeed.update
 end
 if Time.now.hour == 0 # run at midnight
   #User.send_reminders
 end
end