class Employee

  attr_reader :name, :title
  attr_accessor :salary

  def initialize(name, title)
    @name = name
    @title = title
    @observers = []
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end

  def notify_observers
    @observers.each do |o|
      o.update(self)
    end
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

#One way to be really awesome is to factor out the code that doesnt belong to employees
#that is, observer code, into a module. then we can include


