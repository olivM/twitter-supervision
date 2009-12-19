namespace :fetch do
  desc "get next page"
  task :next, :term, :needs => :environment do
    puts "getting next page for #{args[:term]} "
    Tweet.get_page(args[:term])
  end

  desc "get page (number)"
  task :get, :term, :page_nb, :needs => :environment do |t,args|
    puts "getting page ##{args[:page_nb]} for #{args[:term]} "
    Tweet.get_page(args[:term], args[:page_nb])
  end
  
end