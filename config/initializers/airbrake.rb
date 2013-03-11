Airbrake.configure do |config|
  config.host = 'bethel-errors.herokuapp.com'
  config.api_key = '04c08789f3750065e57725b8177abbed'
  config.port = 443
  config.secure = config.port == 443
  config.rescue_rake_exceptions = true
end