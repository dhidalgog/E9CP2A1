class Table
  def initialize(table_name, *daily_income)
    @table_name = table_name
    @daily_income = daily_income.map(&:to_i)
  end

  def show_tables
    puts @table_name
    print @daily_income
    puts " "
  end

  def greater_income
    puts @table_name
    puts @daily_income.max
  end

  def average
    puts @table_name
    puts @daily_income.inject(:+) / @daily_income.length
  end

  def total_average
    
  end
end

def leer_archivo
  file = File.open('casino.txt', 'r')
  data = file.readlines
  file.close
  tables = []
  data.each do |line|
    ls = line.split(', ')
    tables << Table.new(*ls)
  end
  tables
end

arr_tables = leer_archivo
puts "Mesas:"
arr_tables.map(&:show_tables)
puts "Mayor recaudación por mesa"
arr_tables.map(&:greater_income)
puts "Promedio de recaudación por mesa"
average = arr_tables.map(&:average)
puts "Promedio de recaudacion total"
