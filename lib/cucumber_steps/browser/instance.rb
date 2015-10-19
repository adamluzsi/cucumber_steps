require 'watir'
class CucumberSteps::Browser::Instance < Watir::Browser

  require 'cucumber_steps/browser/instance/defaults'
  extend CucumberSteps::Browser::Instance::Defaults

  require 'cucumber_steps/browser/instance/scope_handler'
  include CucumberSteps::Browser::Instance::ScopeHandler

  protected

  def initialize(browser_name, *args)
    super(browser_name, *self.class.args_with_default_options(browser_name, *args))
    Kernel.at_exit { self.close rescue nil } if CucumberSteps::ENVFetcher.close_browser_at_exit?
  end

end
