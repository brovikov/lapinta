class MyskuScraper < Scraper
  def scrap_review
    # Open Review
    @s.visit 'http://mysku.ru/blog/aliexpress/'
    context = @s.all('.topic').first
    @intro = context.find('.sku_short_text').text
    context.find('.topic-title').first('a').click
    @name = @s.find('.topic-title').text

    byebug
  end

  private
  
    def block_external_services
      # @s.driver.browser.url_blacklist = [
      #   'https://www.automaticappliance.com/images/layout/backgrounds',
      # ]
    rescue => e
      rescue_handler(e)
    end
end