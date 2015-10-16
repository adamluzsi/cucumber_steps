module CucumberSteps

  require 'cucumber_steps/debug' if ENV['DEVELOPER_ENV'].to_s.downcase == 'true'

  require 'cucumber'
  require 'cucumber/rb_support/rb_dsl'

  require 'cucumber_steps/browser'

end
