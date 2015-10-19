
And /^I click to the "([^"]+)" field that is near to the "([^"]+)" label$/i do |tag_name,label_text|
  relative_positioned_label = browser.current_scope.label(text: label_text).when_present
  element_to_click = relative_positioned_label.parent.element(tag_name: tag_name).when_present
  element_to_click.click
end

And /^I press the "([^"]+)" button$/i do |button_text|
  element_to_click = browser.current_scope.element(text: button_text).when_present
  element_to_click.click
end

And /^I press click to the element that html attributes match the following: (.*)$/ do |raw_html_attributes|
  element_to_click = browser.current_scope.element(parse_html_attributes(raw_html_attributes)).when_present
  element_to_click.click
end
