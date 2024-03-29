module ApplicationHelper
  def format_datetime datetime
    datetime&.strftime("%-d/%-m/%y  %H:%M %Z")
  end
  
  def contact_reasons
    ['Cannot Login/Signup', 'Demat Account Opening', 'New SIP/Mutual Fund', 'Fund Transfer', 'Site Related Issue', 'Other']
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert' || type == 'error'
      type = 'info' if type == 'info'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end

  def convert_time seconds
    Time.at(seconds).strftime("%H:%M:%S")
  end

  def convert_date date
    date.strftime("%d/%m/%Y")
  end

  def get_color_class status
    case status
    when 'open' then 'lightgreen'
    when 'close' then '#FF7F7F'
    else '#FFBF00'
    end
  end
end
