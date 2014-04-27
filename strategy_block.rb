#strategy pattern
#is a delagation-based approach to solving the same problem as the template method pattern
#Instead of teasing out vars, algo and pushing them down into subclasses, we implement
#each version of the algo in a new object

class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @titile = "yes"
    @text = "texto"
    @formatter = formatter
  end

  def output
    #note how we're passing the context
    #for our receiver class to use
    @formatter.call(self)
  end
end

#can create different formats just by passing the formatter and implementing
#the output method
#
######

#html_formatter = lambda do |context|
#  puts "inside formatter lambda"
#end
#report = Report.new &html_formatter
#report.output

######
#OR

report = Report.new do |context|
  puts "inside formatter lambda"
end
report.output
