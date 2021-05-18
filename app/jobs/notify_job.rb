class NotifyJob < ApplicationJob
  queue_as :default

  def perform(record)
    NotifyService.send_mail_about_new_record(record)
  end
end
