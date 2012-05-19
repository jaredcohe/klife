# http://railscasts.com/episodes/66-custom-rake-tasks

# from terminal run with <rake add_auth_tokens>
task :add_auth_tokens => :environment do
  User.all.each do |user|
    user.auth_token = SecureRandom.urlsafe_base64
    user.save
  end
end