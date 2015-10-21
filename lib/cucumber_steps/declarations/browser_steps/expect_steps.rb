Then(/^the browser url should include "([^"]*)"$/) do |include_text|
  Watir::Wait.until(10, "the url do not include the #{include_text.inspect} text") do
    browser.url.include?(include_text)
  end
end

Then(/^the browser url should not include "([^"]*)"$/) do |include_text|
  Watir::Wait.until(10, "the url do include the #{include_text.inspect} text\n#{browser.url}") do
    not browser.url.include?(include_text)
  end
end

And(/^The browser's url should match the following: \/(.*)\/$/i) do |expected_url|
  Watir::Wait.until(10, "the url do not match the /#{expected_url}/ regular expression") do
    !!(browser.url =~ Regexp.new(expected_url))
  end
end

And(/^the (\w+) with the attributes: (.*?) should match the following text: (.*)$/i) do |tag_name, raw_attr_matcher, expected_match_text|
  Watir::Wait.until(10, "the url do not match the /#{expected_match_text}/ regular expression") do
    begin
      !!((browser.current_scope.element({tag_name: tag_name}.merge(parse_html_attributes(raw_attr_matcher))).when_present.text) =~ Regexp.new(expected_match_text))
    rescue
      false
    end
  end
end

And(/^the browser should include the following text:$/) do |text|
  Watir::Wait.until(10, "the browser do not include the following text: #{text}") do
    browser.current_scope.text.include?(text.strip)
  end
end