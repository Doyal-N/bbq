class EventDecorator < ApplicationDecorator
  delegate_all

  def format_date
    object.datetime.strftime('%d %b %H:%M')
  end

end
