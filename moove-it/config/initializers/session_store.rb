# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_moove-it_session',
  :secret      => 'dd272becfa521db991aeb6cd223b6b2147d67f9ae6119cbf3e31692c36d492c5043f0ec1b58f41f838628335604fa4a04240fd26342276b796818d1c4128a118'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
