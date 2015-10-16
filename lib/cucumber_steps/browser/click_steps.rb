
And /I press the "([^"])" button/i do |button_text|
  browser.element(text: button_text).when_present.click
end


And /^I press click to the element that html attributes match the following: (.*)$/ do |raw_html_attributes|
  browser.element(parse_html_attributes(raw_html_attributes)).when_present.click
end
