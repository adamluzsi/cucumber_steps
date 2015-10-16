And /visit the following url: *(.*)$/ do |url|
  browser.goto(url.strip)
end

And /I visit the "([^"]+)" url/ do |url|
  browser.goto(url)
end