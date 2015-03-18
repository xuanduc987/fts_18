module ApplicationHelper
  def full_title page_title = ''
    base_title = 'Learning System'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def alert_type message_type
    dictionary = {alert: "danger", notice: "info"}
    dictionary.default = message_type
    dictionary[message_type.to_sym]
  end
end
