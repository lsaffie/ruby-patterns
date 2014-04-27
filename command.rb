#command pattern
#One of the most versatile patterns
#Possible to undo/redo things
#
#If we're building a slick ui class, a possible way to imlpement this, is to have every
#button to implement the onbutton_push method. Problem with this is that it'll there will be 
#a class explosion. Since our UI will have so many buttons
#
#class SlickUI
  #def initialize(button)
    #@button = button
  #end

  #def onbutton_push
    #@button.onbutton_push
  #end

#end

#class AwesomeButton
  #def onbutton_push
    #puts "Im an awesome button!"
  #end
#end


class SlickButton
  attr_accessor :command

  def initialize(command)
    @command = command
  end

  def execute
    @command.execute if @command
  end
end

#define commands for all the things our buttons may do

class SaveCommand
  def execute
    puts 'execute save command'
  end
end

class CancelCommand
  def execute
    puts 'execute cancel command'
  end
end

#When button is created, we pass the command
SlickButton.new(SaveCommand.new).execute

#We can queue up commands using the composite patterm
#it's also possible to do/redo things.
#if we want to undo, each subclass specifies an unexecute action undoing what its
#execute method does
