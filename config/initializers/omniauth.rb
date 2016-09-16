OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '556283923273-rudm85hqnmeji4t1maphft51j7rhg084.apps.googleusercontent.com', 'yVI1nukXefr39oSujJtblnln', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end