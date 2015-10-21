# And(/fill Password text\-field with "([^"]*)"$/i) do |password_text|
#
#   password_element = browser.elements(text: /^ *passw(?:or)?d:? *$/i).sort_by { |e| e.text.length }.first.to_subtype
#
#   case password_element
#
#     when Watir::TableDataCell
#       # [:cell_index, :tab_index]
#       value_td = password_element.parent.td(index: password_element.cell_index + 1)
#       value_td.elements.first.set(password_text)
#
#   end
#
#   # $element = password_element
#   # irb_session
#
# end