require 'rspec/core/formatters/base_text_formatter'
require 'rspec/core'
require 'colorize'

class EmojifyRspecFormatter < RSpec::Core::Formatters::BaseTextFormatter

  RSpec::Core::Formatters.register self, *[:example_passed, :example_failed]

  def initialize(output)
    @output = output
  end

  def example_failed(failed)
    @output.print (['😨  ', '😵  ', '🙅  ',
                    '🆘  ', '👎  ', '💔  ',
                    '😭  ', '💩  ', '😐  ',
                    '📉  ', '😱  ', '🙊  '].sample).colorize(:background => :red)
    puts (failed.example.description.strip).colorize(:color => :red)
  end

  def example_passed(passed)
    @output.print (['🍺  ','🙌  ','😍  ',
                    '🆒  ','👌  ','💘  ',
                    '💯  ','🔥  ','😎  ',
                    '📈  ','💪  ','💎  ',
                    '💅  ','💋  ','👑  ',
                    '🎀  ','🎉  ','🎈  '].sample).colorize(:background => :green)
    puts (passed.example.description.strip).colorize(:color => :green)
  end

end
