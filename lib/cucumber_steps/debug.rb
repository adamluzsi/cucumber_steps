def start_irb
  require 'irb'
  require 'irb/completion'
  ARGV.clear
  IRB.start
end

module DebugSteps

  def irb_session
    $b = $browser = browser
    start_irb
  end

end

World(DebugSteps)

And /irb/i do
  irb_session
end