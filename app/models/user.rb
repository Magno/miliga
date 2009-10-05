require 'digest/sha1'
class User < ActiveRecord::Base
  # Virtual attribute for the unencrypted password

	has_many :leagues
  attr_accessor :password

  validates_presence_of     :name, 
														:message => '^No puede dejar su nombre en blanco'
  validates_presence_of     :lastname, 
														:message => '^No puede dejar su apellido en blanco'
	validates_presence_of     :email, 
														:message => '^No puede dejar el correo electr&oacute;nico en blanco'
  validates_presence_of     :password,                   :if => :password_required?, 
														:message => '^No puede dejar su contrase&ntilde;a en blanco'
  validates_presence_of     :password_confirmation,      :if => :password_required?,
														:message => '^No puede dejar su Confirmaci&oacute;n de Contrase&ntilde;a en blanco'														
  validates_length_of       :password, :within => 8..40, :if => :password_required?,
														:message => '^La Contrase&ntilde;a debe ser de al menos 8 caracteres'
  validates_confirmation_of :password,                   :if => :password_required?,
														:message => '^La Confirmaci&oacute;n de Contrase&ntilde;a debe ser igual a la contrase&ntilde;a que escribi&oacute;'
  validates_length_of       :name,    :within => 3..40,
														:message => '^El Nombre debe ser de al menos 3 caracteres'
  validates_length_of       :email,    :within => 3..100,
														:message => '^El formato de su Correo Electr&oacute;nico no es correcto'
  validates_uniqueness_of   :email, :case_sensitive => false,
														:message => '^Este Correo Electr&oacute;nico ya existe en el sistema'
  before_save :encrypt_password
  before_create :make_activation_code 
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :name, :lastname, :email, :password, :password_confirmation
  # Activates the user in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end

  # Authenticates a user by their email name and unencrypted password.  Returns the user or nil.
  def self.authenticate(email, password)
    u = find :first, :conditions => ['email = ? and activated_at IS NOT NULL', email] # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  # Encrypts some data with the salt.
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("--#{salt}--#{password}--")
  end

  # Encrypts the password with the user salt
  def encrypt(password)
    self.class.encrypt(password, salt)
  end

  def authenticated?(password)
    crypted_password == encrypt(password)
  end

  def remember_token?
    remember_token_expires_at && Time.now.utc < remember_token_expires_at 
  end

  # These create and unset the fields required for remembering users between browser closes
  def remember_me
    remember_me_for 2.weeks
  end

  def remember_me_for(time)
    remember_me_until time.from_now.utc
  end

  def remember_me_until(time)
    self.remember_token_expires_at = time
    self.remember_token            = encrypt("#{email}--#{remember_token_expires_at}")
    save(false)
  end

  def forget_me
    self.remember_token_expires_at = nil
    self.remember_token            = nil
    save(false)
  end

  # Returns true if the user has just been activated.
  def recently_activated?
    @activated
  end

  protected
    # before filter 
    def encrypt_password
      return if password.blank?
      self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email}--") if new_record?
      self.crypted_password = encrypt(password)
    end
      
    def password_required?
      crypted_password.blank? || !password.blank?
    end
    
    def make_activation_code

      self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
    end
    
end
