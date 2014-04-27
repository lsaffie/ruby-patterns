#Assembling the whole from the parts with the composite pattern
#
#to build composite, we need tree parts
#base class (common interface)
#leaf classes (indivisible building blocks of the process)
#At least one higher-level class - composite class
#
#Building cake app

#base class
class Task
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

#leaf classes
#
class AddDryIngredientsTask < Task

  def initialize
    super('Add dry ingredients')
  end

  def get_time_required
    1.0
  end
end

class MixTask < Task

  def initialize
    super('mix up')
  end

  def get_time_required
    3.0
  end
end

#composite task
#
class CompositeTask < Task

  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def <<(task)
    @sub_tasks << task
  end

  def remove_subtask(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    @sub_tasks.inject(0) {|r, task| r+ task.get_time_required}
  end
end

class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    self<<(AddDryIngredientsTask.new)
    self<<(MixTask.new)
  end
end

cake = MakeBatterTask.new
puts cake.get_time_required

