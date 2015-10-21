require 'watir'
class CucumberSteps::Browser < Watir::Browser

  require 'cucumber_steps/browser/defaults'
  extend CucumberSteps::Browser::Defaults

  require 'cucumber_steps/browser/scope_handler'
  include CucumberSteps::Browser::ScopeHandler

  protected

  def initialize(browser_name, *args)
    super(browser_name, *self.class.args_with_default_options(browser_name, *args))
    Kernel.at_exit { self.close rescue nil } if CucumberSteps::ENVFetcher.close_browser_at_exit?
  end

end