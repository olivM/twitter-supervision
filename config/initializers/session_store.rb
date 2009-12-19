# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_twitter-supervision_session',
  :secret      => 'e49660ecfd68efa66519194cf37b5694b921228ad73c37adf5dc18cf28f56cc6a413d6bcfb268c57feb086800a013585cb4efb95a83d02f71f2904812cc3f848'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
