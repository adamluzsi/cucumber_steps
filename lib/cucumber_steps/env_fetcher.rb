module CucumberSteps::ENVFetcher
  extend self

  CLI_ALIASES_FOR_TRUE = %W[yes true]
  CLI_ALIASES_FOR_FALSE = %W[no false]

  def development?
    lookup_for_true_case('DEVELOPER_ENV')
  end

  def close_browser_at_exit?
    lookup_for_true_case('CLOSE_BROWSER_AT_EXIT') or
        not lookup_for_false_case('BROWSER_NOT_EXIT_AFTER_TEST', 'BROWSER_NOT_EXIT_AT_EXIT')
  end

  def browser_name
    lookup_value_by('BROWSER','BROWSER_NAME')
  end

  protected

  def lookup_for_true_case(*env_keys)
    filtered_env(env_keys).any? { |k, v| CLI_ALIASES_FOR_TRUE.include?(v.to_s.downcase) }
  end

  def lookup_for_false_case(*env_keys)
    filtered_env(env_keys).any? { |k, v| CLI_ALIASES_FOR_FALSE.include?(v.to_s.downcase) }
  end

  def lookup_value_by(*env_keys)
    filtered_env(env_keys).values.first
  end

  def filtered_env(env_keys)
    lookup_env_keys = env_keys.map(&:to_s).map(&:upcase)

    ENV.select { |env_key, value| lookup_env_keys.include?(env_key) }
  end

end
