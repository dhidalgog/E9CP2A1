class Roulette

  def initialize
    @r = (1..10).to_a
  end

  def play(user_num)
    @random = @r.sample
    File.open('roulette_history.txt', 'a') { |file| file.puts(@random) }
    File.open('winners.txt', 'a') { |file| file.puts(user_num) } if user_num == @random
  end

  def most_generated_number
    numbers = []
    file = File.open('roulette_history.txt', 'r')
    data = file.readlines
    file.close
    data.each { |line| numbers << line.to_i }
    numbers.max_by { |num| numbers.count(num) }
  end
end

rou1 = Roulette.new
rou1.play(5)
rou1.play(1)
rou1.play(2)
rou1.play(3)
rou1.play(6)
rou1.play(5)
rou1.play(1)
rou1.play(2)
rou1.play(3)
rou1.play(6)
puts "El numero que más veces generó la ruleta es:"
puts rou1.most_generated_number