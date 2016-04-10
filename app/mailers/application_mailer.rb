class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout 'mailer'

  #app/mailers/mailman.rb
  class Mailman < ApplicationMailer
  end
end
