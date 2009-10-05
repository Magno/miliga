class EmailController < ApplicationController

  
  def remind
    @title = "Enviar mi informaci&oacute;n"
    if param_posted?(:user)
      email = params[:user][:email]
      user = User.find_by_email(email)
      if user
        UserMailer.deliver_reminder(user)
        flash[:notice] = "La nueva contraseña ha sido enviada a tu correo correctamente."
        redirect_to :controller => "sessions", :action => "new"
      else
        flash[:error] = "No existe ning&uacute;n usuario con ese correo electr&oacute;nico."  
      end
    end
  end
end
