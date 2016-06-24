class ScraperService
  def initialize(scraper)
    @scraper = scraper
  end

  def scrap_review
    @scraper.scrap_review
  end
end