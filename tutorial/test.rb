input1 = gets
input23 = gets.chomp
input4 = gets.chomp
p "#{input1.to_i + (input23.split(' ').map(&:to_i).inject(:+))} #{input4}\n"
