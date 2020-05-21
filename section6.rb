# 繰り返し

# 繰り返しは0から行われるため、1から行いたい場合は意図的に足さないとならない

3.times do |i|
  puts "#{i+1}ばんめの繰り返し"
end

# 1から5までの数字を足す

# times 一定の回数だけ同じ処理を行う

sum = 0
for i in 1..5
  sum = sum + i
end
puts sum 
# 1 + 2 + 3 + 4 +5
# どんどん足しているものが増えるイメージ
# こう書き換えることで自由に値を決められる
# つまり、timesで+1する必要がなくなる

from = 1
to = 2
sum = 1

for i in from..to
  sum += sum * i
  # 1*2*3
end
puts sum

from = 1
to = 5
sum = 2
number = 0
# 掛け算の和
for i in from..to
  number += sum * i
  # 1*2*3
end
puts number

# until文はwhile文の否定みたいな感じ
# ただし、親になった瞬間抜けるので注意、whileと違って最後の値が評価されないことがある。

