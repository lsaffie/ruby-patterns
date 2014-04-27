#Observer was originally coded as a class rather than a module.
#
#If we use a class, Payroll, etc would need to inherit from it to take advantage
#of its methods. As a module, however, It can be easily mixed in.
#
module Observer

  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |o|
      o.update(self)
    end
  end
end

class Employee
  attr_reader :name, :title
  attr_accessor :salary

  include Observer

  def initialize(name, title)
    super()
    @name = name
    @title = name
    @salary = nil
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

#Observer one
class Payroll
  def update(observable)
    puts "i've been notified of change #{observable.salary}"
  end
end

#Observer two
class TaxMan
  def update(observable)
    puts "notify tax man of change #{observable.salary}"
  end
end

#create employee
employee = Employee.new("George", "Manager")

#register observers
employee.add_observer(Payroll.new)
employee.add_observer(TaxMan.new)

#change salary
employee.salary= "200"


