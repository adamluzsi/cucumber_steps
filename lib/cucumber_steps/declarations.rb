require 'cucumber_steps'

require 'cucumber_steps/declarations/debug_steps' if CucumberSteps::ENVFetcher.development?
require 'cucumber_steps/declarations/browser_steps'