require 'date'

# Clase cursos
class Course
  def initialize(course_name, s_date, e_date)
    @course_name = course_name
    @s_date = Date.parse(s_date)
    @e_date = Date.parse(e_date)
  end

  def show
    puts @course_name, @s_date, @e_date
  end

  def after_courses(date = Date.today)
    fecha_invalida = Date.parse('2018-01-01')
    raise ArgumentError.new('La fecha no sirve') if date == fecha_invalida
    puts @e_date if @e_date > date
  end

  def before_courses(date = Date.today)
    fecha_invalida = Date.parse('2018-01-01')
    raise ArgumentError.new('La fecha no sirve') if date == fecha_invalida
    puts @s_date if @s_date < date
  end
end

def leer_archivo
  file = File.open('cursos.txt', 'r')
  data = file.readlines
  file.close
  courses = []
  data.each do |line|
    ls = line.split(', ')
    courses << Course.new(*ls)
  end
  courses
end

arr_courses = leer_archivo
arr_courses.map(&:show)

# ---
puts "Ingresar fecha: (yyyy-mm-dd)"
after_date = gets.chomp
Date.parse(after_date)
puts "Cursos que finalizaran despues de la siguiente fecha #{after_date}"
arr_courses.each do |course|
  course.after_courses(after_date)
end

puts "Ingresar fecha: (yyyy-mm-dd)"
before_date = gets.chomp
Date.parse(before_courses)
puts "Cursos que inician antes de la siguiente fecha #{before_date}"
arr_courses.each do |course|
  course.before_courses(before_date)
end
