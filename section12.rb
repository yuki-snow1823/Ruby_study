# Numericクラスにも整数、不動小数点数、有理数、無理数などがある

# 分母分子の取り出し方
a = Rational(2,5)
b = Rational(1,3)
p [a,b]
c = a + b
p c
c.to_f # 少数に。floatのこと
# 分母、分子の順
p [c.numerator, c.denominator]

# integerとfloatを計算するとfloatになる

# 乱数を生かしたsecurerandomというライブラリがある

require "securerandom"

p SecureRandom.random_bytes(10)

# 練習問題

# 1
def cels2fahr(cels)
  return cels * 9.0 / 5.0 + 32.0
end

# 2
def fahr2cels(fahr)
  return (fahr.to_f - 32) * 5.0 / 9.0
end

1.upto(100) do |i|
  puts fahr2cels(i), "\n"
end

# 3
def dice
  # ランダムクラス
  return Random.rand(6) + 1
end

# 10
def dice10
  total = 0
  10.times do 
    total += dice
  end
  return total
end

p dice10

def prime?(num)
  (2..num).each do |i|
    if num % i == 0 && num == i
      return true
    elsif num % i == 0
      return false
    end
  end
end

# 解答
# まず、2より小さい数は素数でないとします。それ以上の数は、2からその数の平方根まで割り算を行って、すべての剰余が0でないことを確認します。

def prime?(num)
  # 例外処理
  return false if num < 2
  2.upto(Math.sqrt(num)) do |i|
    if num % i == 0
      return false
    end
  end
  return true
end

1.upto(10) do |n|
  puts n if prime?(n)
end
