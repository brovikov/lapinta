class Scraper
  include UserAgents
  
  def initialize
    @logger = Logger.new(STDOUT)
    @s = Capybara::Session.new(:poltergeist) 
    set_user_agent(@s)
  end

  def log(message)
    @logger.debug message
  end

  def wait_for(context, string)
    (0..10).each do
        break if context.has_content?(string)
        log 'sleeping...'
        sleep 1
      end
  end

  def rescue_handler(e)
    log message
    false
  end
end