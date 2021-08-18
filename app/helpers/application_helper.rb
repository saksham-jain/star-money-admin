module ApplicationHelper
  def format_datetime datetime
    datetime&.strftime("%-d/%-m/%y  %H:%M %Z")
  end
  
  def contact_reasons
    ['Cannot Login/Signup', 'Demat Account Opening', 'New SIP/Mutual Fund', 'Fund Transfer', 'Site Related Issue', 'Other']
  end
end
