class <%= class_name %>Mailer < ActionMailer::Base
  def signup_notification(<%= file_name %>)
    setup_email(<%= file_name %>)
    @subject    += 'Por favor active su cuenta en la siguiente liga'
  <% if options[:include_activation] %>
    @body[:url]  = "http://#{$HOST}/activate/#{<%= file_name %>.activation_code}"
  <% else %>
    @body[:url]  = "http://#{$HOST}/login/" <% end %>
  end
  
  def activation(<%= file_name %>)
    setup_email(<%= file_name %>)
    @subject    += 'Su cuenta ha sido activada exitosamente'
    @body[:url]  = "http://#{$HOST}/"
  end
  
  protected
    def setup_email(<%= file_name %>)
      @recipients  = "#{<%= file_name %>.email}"
      @from        = 'magnolia@innku.com'
      @subject     = "#{$HOST}"
      @sent_on     = Time.now
      @body[:<%= file_name %>] = <%= file_name %>
    end
end
