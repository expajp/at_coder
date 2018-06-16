nums = gets.chomp.split(' ').map(&:to_i)
print (nums.find{ |n| n>8 } ? ':(' : 'Yay!')
