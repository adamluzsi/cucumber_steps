require "bundler/gem_tasks"

# From https://gist.github.com/778535
# In turn based on http://www.natontesting.com/2010/01/11/updated-script-to-list-all-cucumber-step-definitions/
desc "List all available steps"
task :steps do
  require 'hirb'
  extend Hirb::Console
  features_dir = ENV['FEATURES_PATH'] ||  "features"
  step_candidates = Dir.glob(File.join(features_dir,'**/*.rb'))

  # Follow all the gem requires, and identify which files have steps in them
  step_files = []
  step_candidates.each do |candidate|

    File.foreach(candidate) do |line|
      if line =~ /require ['"](.*\/.*)['"]/
        if libfile = `gem which #{$1} 2>/dev/null`.chomp
          step_candidates << libfile unless step_candidates.include?(libfile)
        end
      elsif line =~ /^\s*(?:Given|When|Then)\s+/
        step_files << candidate
      end
    end
  end

  step_files.uniq.each do |step_file|
    puts "File: #{step_file}"
    puts ""
    results = []
    File.new(step_file).read.each_line.each_with_index do |line, number|
      next unless line =~ /^\s*(?:Given|When|Then)\s+|\//
      res = /(?:Given|When|Then)[\s\(]*\/(.*)\/([imxo]*)[\s\)]*do\s*(?:$|\|(.*)\|)/.match(line)
      next unless res
      matches = res.captures
      results << OpenStruct.new(
          :steps => matches[0],
          :args => matches[2]
      )
    end
    table results, :resize => false, :fields=>[:steps, :args]
    puts ""

  end
end