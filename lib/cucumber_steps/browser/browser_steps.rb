
And /^I use "([^"]+)" (?:as a)? browser$/i do |new_browser_name|
  browser_name(new_browser_name.strip)
end

And /the browser is (.*)$/i do |new_browser_name|
  browser_name(new_browser_name.strip)
end