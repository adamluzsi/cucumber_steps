require 'cucumber_steps/step_definitions/browser_steps/configure_steps'
require 'cucumber_steps/step_definitions/browser_steps/click_steps'
require 'cucumber_steps/step_definitions/browser_steps/expect_steps'
require 'cucumber_steps/step_definitions/browser_steps/hover_steps'
require 'cucumber_steps/step_definitions/browser_steps/sketch_steps'
require 'cucumber_steps/step_definitions/browser_steps/typing_steps'
require 'cucumber_steps/step_definitions/browser_steps/visit_steps'

require 'cucumber_steps/world_extensions/browser_methods'
World(CucumberSteps::Support::BrowserMethods)

After do
  browser.close if CucumberSteps::ENVFetcher.close_browser_at_exit?
end