require 'cucumber_steps/declarations/browser_steps/configure_steps'
require 'cucumber_steps/declarations/browser_steps/click_steps'
require 'cucumber_steps/declarations/browser_steps/expect_steps'
require 'cucumber_steps/declarations/browser_steps/hover_steps'
require 'cucumber_steps/declarations/browser_steps/sketch_steps'
require 'cucumber_steps/declarations/browser_steps/typing_steps'
require 'cucumber_steps/declarations/browser_steps/visit_steps'

require 'cucumber_steps/world_extensions/browser_methods'
World(CucumberSteps::WorldExtensions::BrowserMethods)