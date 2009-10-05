class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Por favor active su cuenta en la siguiente liga'
  
		@body[:url]  = "#{$HOST}/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Su cuenta ha sido activada exitosamente'
	@body[:url]  = "#{$HOST}"

  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "magnolia@innku.com"
      @subject     = "#{$HOST}"
      @sent_on     = Time.now
      @body[:user] = user
    end
end
