
And /I click to the "([^"]+)" field that is near to the "([^"]+)" label/i do |tag_name,label_text|
  relative_positioned_label = browser.label(text: label_text).when_present

  relative_positioned_label.parent.element(tag_name: tag_name).when_present.click
end

And /I press the "([^"])" button/i do |button_text|
  browser.element(text: button_text).when_present.click
end


And /^I press click to the element that html attributes match the following: (.*)$/ do |raw_html_attributes|
  browser.element(parse_html_attributes(raw_html_attributes)).when_present.click
end
