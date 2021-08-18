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
      type = 'error' if type == 'alert'
      type = 'info' if type == 'info'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: true, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end
end
