And /visit the following url: *(.*)$/ do |url|
  browser.goto(url.strip)
end
