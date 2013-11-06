# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
# Djpost::Application.config.secret_key_base = 'f4140c1f940c9620f0335a9953c2599eadecdeae94b388917deb56973cd7405a6d0fb8b0c6e9c67ff4c8eb61253ffc839f081210f9bef5aed1969680acf5924b'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

Djpost::Application.config.secret_key_base = secure_token