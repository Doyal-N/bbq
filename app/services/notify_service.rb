# frozen_string_literal: true

module NotifyService
  def self.send_mail_about_new_record(record)
    emails = collect_emails(record)

    emails.each do |email|
      case record
      when Image then NotifyMailer.added_image(record, email).deliver_later
      when Comment then NotifyMailer.added_comment(record, email).deliver_later
      end
    end
  end

  def self.collect_emails(record)
    event = record.event
    event.subscribers.pluck(:email) + [event.user.email] - [record.user&.email]
  end
end
