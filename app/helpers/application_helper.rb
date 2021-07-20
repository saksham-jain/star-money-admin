module ApplicationHelper
  def format_datetime datetime
    datetime&.strftime("%-d/%-m/%y  %H:%M %Z")
  end
end
