
And /^I use "([^"]+)"(?: as the)? browser$/i do |new_browser_name|
  self.browser_name= new_browser_name
end

And /the browser is (.*)$/i do |new_browser_name|
  self.browser_name= new_browser_name
end