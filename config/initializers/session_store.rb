# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_miliga_session',
  :secret      => 'daaf0e0acd6ccfc485fa1df771d2ef09c9035eb71d30d8c236b6665183e7905f761401c3c6a211167bcf3908cb564d5a935f81b89f887b5e21ddc0985032b26f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
