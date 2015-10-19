module CucumberSteps

  require 'cucumber_steps/env_fetcher'

  require 'cucumber_steps/debug' if CucumberSteps::ENVFetcher.development?

  require 'cucumber'
  require 'cucumber/rb_support/rb_dsl'

  require 'cucumber_steps/browser'

end
