module CucumberSteps::Browser::Defaults

  BROWSER_ARGUMENTS = {
      'phantomjs' => {
          # --load-plugins=[yes|no]            Load all plugins (i.e. 'Flash', 'Silverlight', ...)  (default is 'no').
          # --ignore-ssl-errors=[yes|no]       Ignore SSL errors (i.e. expired or self-signed certificate errors).
          # --ssl-protocol=any
          # --config=/path/to/config
          # # javascriptCanCloseWindows: true
          # # javascriptCanOpenWindows: true
          # # javascriptEnabled: true
          args: ['--ssl-protocol=any']
      }

  }

  def args_with_default_options(browser_name, *args)

    unless args.any? { |e| e.is_a?(Hash) }
      args.unshift({})
    end

    options = args.find { |e| e.is_a?(Hash) }

    pare_defined_options = ::CucumberSteps::Browser::Defaults::BROWSER_ARGUMENTS[browser_name.to_s] || {}
    options.merge!(pare_defined_options) if pare_defined_options.is_a?(Hash)

    return args

  end

end
