require 'rspec/core/formatters/progress_formatter'

class RubymineBacktraceLinkFormatter < RSpec::Core::Formatters::ProgressFormatter
  def example_failed(example, counter, failure)
    super
    @output.puts "Aborting after first failure"
    exit
  end
end

#require 'spec/runner/formatter/progress_bar_formatter'
#
## Example of a formatter with custom bactrace printing. Run me with:
## ruby bin/spec examples/failing -r examples/passing/custom_formatter.rb -f CustomFormatter
#class CustomFormatter < Spec::Runner::Formatter::ProgressBarFormatter
#  def backtrace_line(line)
#    line.gsub(/([^:]*\.rb):(\d*)/) do
#      "<a href=\"file://#{File.expand_path($1)}\">#{$1}:#{$2}</a> "
#    end
#  end
#end