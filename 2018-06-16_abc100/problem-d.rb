# coding: utf-8
nums = gets.chomp.split(' ').map(&:to_i)
cakes = []
nums[0].times do
  cakes << gets.chomp.split(' ').map(&:to_i)
end

if nums[1] < nums[0]/2
  combi = cakes.combination(nums[1]).to_a
  p combi.map{ |cs| cs.transpose.map{ |c| c.inject(:+).abs }.inject(:+) }.max
else
  all = cakes.transpose.map{ |c| c.inject(:+) }
  combi = cakes.combination(nums[0]-nums[1]).to_a
  vals = combi.map{ |cs| cs.transpose.map{ |c| c.inject(:+) } }
  ans = vals.map do |val|
    val.map.with_index{ |n, i| (all[i]-n).abs }.inject(:+)
  end.max
  p ans
end


=begin
評価関数をつけてみる？
allの場合の値がプラスかマイナスか
それで横列の戦闘力を測る
戦闘力の高い順にM個取ればそれが最大値

all = cakes.transpose.map{ |c| c.inject(:+) }
new_cakes = cakes.map.with_index do |a, i|
  {
    val: a.map.with_index{ |n, i| (all[i]*n < 0 ? -(n.abs) : n.abs) }.inject(:+),
    i: i
  }
end
p new_cakes.sort{ |a, b| (a[:val] > b[:val] ? -1 : 1) }
new_cakes = new_cakes.sort{ |a, b| (a[:val] > b[:val] ? -1 : 1) }.map{ |h| h[:i] }.take(nums[1])
p new_cakes.map{ |i| cakes[i] }.transpose.map{ |c| c.inject(:+).abs }.inject(:+)

結果：正しい答えがでない
=end
