require 'watir'
require 'cucumber_steps/browser/browser_steps'
require 'cucumber_steps/browser/click_steps'
require 'cucumber_steps/browser/expect_steps'
require 'cucumber_steps/browser/hover_steps'
require 'cucumber_steps/browser/sketch_steps'
require 'cucumber_steps/browser/typing_steps'
require 'cucumber_steps/browser/visit_steps'

module CucumberSteps::Browser

  BROWSER_ARGUMENTS = {
      'phantomjs' => {
          # --load-images=[yes|no]             Load all inlined images (default is 'yes').
          # --load-plugins=[yes|no]            Load all plugins (i.e. 'Flash', 'Silverlight', ...)  (default is 'no').
          # --proxy=address:port               Set the network proxy.
          # --disk-cache=[yes|no]              Enable disk cache (at desktop services cache storage location, default is 'no').
          # --ignore-ssl-errors=[yes|no]       Ignore SSL errors (i.e. expired or self-signed certificate errors).
          # --ssl-protocol=any
          args: ['--ssl-protocol=any']
      }

  }

  def browser
    @browser || reopen_browser!
  end

  def reopen_browser!

    if @browser.is_a?(::Watir::Browser)
      @browser.close
    end

    @browser = ::Watir::Browser.new(browser_name, browser_options)

  end

  def browser_name(browser_name=nil)
    @browser_name = browser_name unless browser_name.nil?
    @browser_name || 'phantomjs'
  end

  def browser_options
    options = {}
    pare_defined_options = BROWSER_ARGUMENTS[browser_name]
    options.merge!(pare_defined_options) if pare_defined_options.is_a?(Hash)

    options
  end

  def parse_html_attributes(raw_attributes)
    raw_attributes.scan(/(\w+)="([^"]+)"/).reduce({}) do |all_matcher, (attr_name, value)|
      all_matcher[attr_name.downcase.to_sym]=value
      all_matcher
    end
  end

end

World(CucumberSteps::Browser)


