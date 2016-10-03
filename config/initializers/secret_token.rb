# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '04bec4d8e801ec4dadff2326f77ecea92b6216464aff719e63ae645c8a5f77a1bdad82307c97cf9bd34f73225503160bcd67dacc90322071210039c1c43eed9f'
require 'securerandom'

def secure_token
  if File.exists?(token_file)
  	#Use the existing token
  	File.read(token_file).chomp
  else
  	# Generate a new token and store in in token_file
  	token = SecureRandon.hex(64)
  	File.write(token_file, token)
  	token
  end
end

SampleApp::Application.config.secret_key_base = secure_token