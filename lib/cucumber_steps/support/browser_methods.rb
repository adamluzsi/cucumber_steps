module CucumberSteps::Support::BrowserMethods

  require 'cucumber_steps/browser'

  def browser
    @browser || reopen_browser!
  end

  def reopen_browser!

    if @browser.is_a?(::CucumberSteps::Browser)
      @browser.close
    end

    browser = ::CucumberSteps::Browser.new(browser_name)
    @browser = browser

  end

  def browser_name=(new_browser_name)
    @browser_name = new_browser_name.to_s.strip
  end

  def browser_name
    CucumberSteps::ENVFetcher.browser_name || @browser_name || 'phantomjs'
  end

  def parse_html_attributes(raw_attributes)
    raw_attributes.scan(/(\w+)="([^"]+)"/).reduce({}) do |all_matcher, (attr_name, value)|
      all_matcher[attr_name.downcase.to_sym]=value
      all_matcher
    end
  end

end