module ApplicationHelper
  def format_datetime datetime
    datetime&.strftime("%-d/%-m/%y  %H:%M %Z")
  end
  
  def contact_reasons
    ['New Account Opening', 'Fund Transfer']
  end
end
