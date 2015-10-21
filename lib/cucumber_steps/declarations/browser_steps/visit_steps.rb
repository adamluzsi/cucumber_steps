And /^I (?:visit|goto) the following url: *(.*)$/ do |url|
  browser.goto(url.strip)
end

And /^I (?:visit|goto) the "([^"]+)" url$/ do |url|
  browser.goto(url)
end