# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: ENV['MY_MAIL']
  layout 'mailer'
end
