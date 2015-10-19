And /^From here I work (?:in|with) iframe$/i do
  browser.add_locating_scope :work_with_iframe do |scope|
    ::Watir::Wait.until { scope.iframes.count > 0 }

    scope.iframe
  end
end

And /^I no longer work (?:in|with) iframe$/i do
  browser.pop_locating_scope(:work_with_iframe)
end

And /^in the browser(?: without any additional scoping)?$/ do
  browser.clear_locating_scopes!
end