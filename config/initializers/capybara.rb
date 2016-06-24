require 'capybara/poltergeist'
# ===++ Capubara configure section ++===
Capybara.register_driver :poltergeist do |app|
  # For prevent memory leak - not using load-images=no
  # Capybara::Poltergeist::Driver.new(app, phantomjs_options: ['--load-images=no', '--ignore-ssl-errors=yes', '--ssl-protocol=any'], js_errors: false)
  Capybara::Poltergeist::Driver.new(app, phantomjs_options: ['--ignore-ssl-errors=yes', '--ssl-protocol=any'], js_errors: false)
end
Capybara.default_driver = :poltergeist 
Capybara.run_server = false
Capybara.default_max_wait_time = 5
# ===++ Capubara configure section ++===