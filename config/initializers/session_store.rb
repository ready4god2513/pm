# Be sure to restart your server when you modify this file.

Nomadpm::Application.config.session_store :active_record_store, key: "_nomadpm_session", :domain => :all

# Use the database for sessions instead of the cookie-based default,
# which shouldn"t be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Nomadpm::Application.config.session_store :active_record_store
