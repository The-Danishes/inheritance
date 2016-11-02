class Employee
  attr_reader :first_name, :last_name
  attr_accessor :active

  def initialize(input_options)
    @first_name = input_options[:first_name] || "First"
    @last_name = input_options[:last_name] || "Last"
    @salary = input_options[:salary] || 0
    @active = input_options[:active] || true
  end

  def print_info
    puts "#{@first_name} #{@last_name} makes #{@salary} a year."
  end

  def give_annual_raise
    @salary = 1.05 * @salary
  end

  def fire
    @active = false
  end

end


class Manager < Employee
  attr_reader :employees

  def initialize(input_options)
    super
    @employees = input_options[:employees]
  end

  def give_annual_raise
    @salary = 2 * @salary
  end

  def give_all_raises
    employees.each do |employee|
      employee.give_annual_raise
    end
  end

  def fire_all_employees
    employees.each do |employee|
      employee.fire
    end
  end


  def send_reports
    puts "Sending reports"
  end

  def list_employees
    employees.each do |employee|
      puts employee.first_name
    end
  end
end

employee1 = Employee.new({first_name: "Majora", last_name: "Carter", salary: 80000, active: true})
employee2 = Employee.new(first_name: "Danilo", last_name: "Campos", salary: 70000, active: true)
employee1.print_info
employee2.print_info

employee_array = []
employee_array << employee1
employee_array << employee2

manager1 = Manager.new({first_name: "Manager", last_name: "Person", salary: 100, active: true, employees: employee_array})
manager1.give_all_raises
employee1.print_info
employee2.print_info

manager1.fire_all_employees
puts employee1.active
puts employee2.active

