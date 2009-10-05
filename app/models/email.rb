class Email < ActiveRecord::Base
  attr_accessor :subject, :body, :recipients
  
#  validates_presence_of :subject, :body, :recipients
#  validates_format_of :recipients, :message => "El formato de los correos que proporcion&oacute; no son v&aacute;lidos",
#								 :with => /^(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,5})?(([a-z0-9A-Z_\-\.]+(([\'\.\- ][a-z0-9A-Z_ ])?[a-z0-9A-Z_]*)*\s*<(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,5})>))?(([,.][\s]*([a-z0-9A-Z_\-\.]+(([\'\.\- ][a-z0-9A-Z_ ])?[a-z0-9A-Z_]*)*\s*<(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,5}))>)*([,.][\s]*(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,5}))*)*$/i
  #validates_length_of   :subject, :maximum => DB_STRING_MAX_LENGTH
  #validates_length_of   :body,    :maximum => DB_TEXT_MAX_LENGTH
  
  def initialize(params)
	  @subject = params[:subject]
    @body = params[:body]
    @recipients = params[:recipients]
  end
end
