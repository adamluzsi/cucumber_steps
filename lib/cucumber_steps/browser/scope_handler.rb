module CucumberSteps::Browser::ScopeHandler

  def current_scope
    target_scope = self

    locating_scopes.each do |location_def|
      target_scope = location_def.call(target_scope)
    end

    target_scope
  end

  def add_locating_scope(locating_scope_name, &block)
    locating_scopes.push([locating_scope_name.to_s.to_sym, block])
    nil
  end

  def pop_locating_scope(locating_scope_name)
    locating_scope_name = locating_scope_name.to_s.to_sym
    locating_scopes.delete_if { |name, block| name == locating_scope_name }
    nil
  end

  def clear_locating_scopes!
    locating_scopes.clear
    nil
  end

  protected

  def locating_scopes
    @locating_scopes ||= []
  end

end