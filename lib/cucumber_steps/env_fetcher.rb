module CucumberSteps::ENVFetcher
  extend self

  TRANSLATE_TABLE = {
      'yes' => true,
      'true' => true,
      'no' => false,
      'false' => false
  }

  def development?
    lookup_for true, 'DEVELOPER_ENV'
  end

  def close_browser_at_exit?
    not lookup_for(false, 'CLOSE_BROWSER_AT_EXIT', 'BROWSER_CLOSE_AT_EXIT','CLOSE_BROWSER')
  end

  def browser_name
    lookup_value_by('BROWSER', 'BROWSER_NAME')
  end

  protected

  def lookup_for(boolean, *env_keys)
    formatted_env(filtered_env(env_keys)).any? { |k, v| v == boolean }
  end

  def lookup_value_by(*env_keys)
    filtered_env(env_keys).values.first
  end

  def formatted_env(filtered_env)
    filtered_env.reduce({}) { |m, (k, v)| m.merge!({k => TRANSLATE_TABLE[v]}); m }
  end

  def filtered_env(env_keys)
    lookup_env_keys = env_keys.map(&:to_s).map(&:upcase)
    ENV.select { |env_key, value| lookup_env_keys.include?(env_key) }
  end

end
