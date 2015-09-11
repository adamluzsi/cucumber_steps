require 'watir'
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
    @browser ||= ::Watir::Browser.new(browser_name, browser_options)
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

And /I use "([^"]+)" browser$/i do |new_browser_name|
  browser_name(new_browser_name.strip)
end

And /the browser is (.*)$/i do |new_browser_name|
  browser_name(new_browser_name.strip)
end

And /visit the following url: *(.*)$/ do |url|
  browser.goto(url.strip)
end

# And /i visit the following /i

And(/^The browser should match the following url: (.*)$/i) do |expected_url|
  expect(browser.url).to match(Regexp.new(expected_url))
end

Then(/write in the browser the following value where matching attributes: (.+)$/i) do |raw_attributes, set_string_value|

  browser.elements(parse_html_attributes(raw_attributes)).each do |element|
    element.when_present.to_subtype.set(set_string_value)
  end

end

And(/^the (\w+) with the attributes: (.*?) should match the following text: (.*)$/i) do |tag_name, raw_attr_matcher, expected_match_text|
  expect(browser.element({tag_name: tag_name}.merge(parse_html_attributes(raw_attr_matcher))).when_present.text).to match(Regexp.new(expected_match_text))
end

And(/^there is a html element with the following text: (.*)$/) do |text|
  html_element = browser.element(text: Regexp.new(Regexp.escape(text.strip)))

  expect(html_element.when_present.to_subtype.methods).to include(:click)
end

And(/fill Password text\-field with "([^"]*)"$/i) do |password_text|

  password_element = browser.elements(text: /^ *passw(?:or)?d:? *$/i).sort_by { |e| e.text.length }.first.to_subtype

  case password_element

    when Watir::TableDataCell
      # [:cell_index, :tab_index]
      value_td = password_element.parent.td(index: password_element.cell_index + 1)
      value_td.elements.first.set(password_text)

  end

  # $element = password_element
  # irb_session

end