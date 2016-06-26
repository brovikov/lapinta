require 'open-uri'
require 'rss'

class MyskuScraper < Scraper
  def scrap_reviews
    # Open Review
    page_ids = get_links_for_scraping
    page_ids.each do |id|
      scrap_page(id)
    end

  end

  private
  
    def block_external_services
      # @s.driver.browser.url_blacklist = [
      #   'https://www.automaticappliance.com/images/layout/backgrounds',
      # ]
    rescue => e
      rescue_handler(e)
    end

    def get_links_for_scraping
      page_ids = []
      feed = RSS::Parser.parse('http://mysku.ru/rss/blog/aliexpress/')
      feed.items.each do |item|
        page_ids << item.link.split('/').last.split('.').first
        break
      end
      page_ids
    end

    def scrap_page(id)
      html_doc = Nokogiri::HTML(open("http://mysku.ru/blog/aliexpress/#{id}.html"))
      name = nil# ...
      html_body = html_doc.xpath('//*[@id="content"]/div[2]/div[1]/div[2]')
      intro = html_body.first.children.first.text
      html_body.children[1..-1].each do |node|
        # next if node.attributes['name'].value == 'mcut'
        generate_body(node)
      end


      byebug
      @intro = @s.find('.sku_short_text').text
      @name = @s.find('.topic-title').text
    end

    def generate_body(node)
      byebug
    end
end

