#strategy pattern
#is a delagation-based approach to solving the same problem as the template method pattern
#Instead of teasing out vars, algo and pushing them down into subclasses, we implement
#each version of the algo in a new object
class HTMLFormatter
  def output(context)
    puts context.title
    puts context.text
  end
end

class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(formatter)
    @titile = "yes"
    @text = "texto"
    @formatter = formatter
  end

  def output
    #note how we're passing the context
    #for our receiver class to use
    @formatter.output(self)
  end
end

#can create different formats just by passing the formatter and implementing
#the output method
report = Report.new(HTMLFormatter.new)
report.output
