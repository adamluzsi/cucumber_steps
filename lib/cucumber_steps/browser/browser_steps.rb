
And /^I use "([^"]+)"(?: as the)? browser$/i do |new_browser_name|
  browser_name(new_browser_name.strip)
end

And /the browser is (.*)$/i do |new_browser_name|
  browser_name(new_browser_name.strip)
end