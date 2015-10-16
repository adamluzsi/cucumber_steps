
And(/^The browser's url should match the following: (.*)$/i) do |expected_url|
  expect(browser.url).to match(Regexp.new(expected_url))
end

And(/^the (\w+) with the attributes: (.*?) should match the following text: (.*)$/i) do |tag_name, raw_attr_matcher, expected_match_text|
  expect(browser.element({tag_name: tag_name}.merge(parse_html_attributes(raw_attr_matcher))).when_present.text).to match(Regexp.new(expected_match_text))
end

And(/^there is a html element with the following text: (.*)$/) do |text|
  html_element = browser.element(text: Regexp.new(Regexp.escape(text.strip)))

  expect(html_element.when_present.to_subtype.methods).to include(:click)
end
