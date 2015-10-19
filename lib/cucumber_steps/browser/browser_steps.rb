And /^I use "([^"]+)"(?: as the)? browser$/i do |new_browser_name|
  self.browser_name= new_browser_name
end

And /^the browser is (.*)$/i do |new_browser_name|
  self.browser_name= new_browser_name
end

And /^the browser resolution is (\d+)x(\d+) pixels$/i do |width, height|
  browser.window.resize_to(width.to_i, height.to_i)
end