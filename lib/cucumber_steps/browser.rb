require 'cucumber_steps/browser/browser_steps'
require 'cucumber_steps/browser/click_steps'
require 'cucumber_steps/browser/expect_steps'
require 'cucumber_steps/browser/hover_steps'
require 'cucumber_steps/browser/sketch_steps'
require 'cucumber_steps/browser/typing_steps'
require 'cucumber_steps/browser/visit_steps'

module CucumberSteps::Browser

  require 'cucumber_steps/browser/instance'

  def browser
    @browser || reopen_browser!
  end

  def reopen_browser!

    if @browser.is_a?(::CucumberSteps::Browser::Instance)
      @browser.close
    end

    browser = ::CucumberSteps::Browser::Instance.new(browser_name)
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

World(CucumberSteps::Browser)


