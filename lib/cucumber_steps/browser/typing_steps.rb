And /^I type the following into the browser:$/i do |text_to_be_typed|
  browser.send_keys(text_to_be_typed.to_s)
end

[

    :null, :cancel, :help, :backspace, :tab, :clear, :return, :enter, :shift, :left_shift, :control, :left_control, :alt, :left_alt,
    :pause, :escape, :space, :page_up, :page_down, :end, :home, :left, :arrow_left, :up, :arrow_up, :right, :arrow_right, :down, :arrow_down, :insert, :delete, :semicolon, :equals,
    :numpad0, :numpad1, :numpad2, :numpad3, :numpad4, :numpad5, :numpad6, :numpad7, :numpad8, :numpad9,
    :multiply, :add, :separator, :subtract, :decimal, :divide,
    :f1, :f2, :f3, :f4, :f5, :f6, :f7, :f8, :f9, :f10, :f11, :f12,
    :meta, :command

].each do |special_key|

  And /^I hit #{special_key.to_s.inspect} to the browser$/ do
    browser.send_keys(:enter)
  end

end

