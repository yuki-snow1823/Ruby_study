# Procクラス

# そもそもブロックはこういうもの

# 3.times do |a|
#   p a 
# end
# #=> 0 1 2

# 3.times { |a| p a }
# #=> 0 1 2

# Procとはブロックを持ち運び便利なオブジェクトにしたもの
# lambdaとはProcオブジェクトを作る方法の一つで、lambdaメソッドによって作成されたProcオブジェクトはProc.newで作成されたオブジェクトといくつか異なる点を持ちます。

def power_of(n)
  lambda do |x|
    return x ** n
  end
end

cube = power_of(3)
p cube.call(5) # 動く。lambdaのところがProc.newだと動かない

# fizz = proc{|n| % 3 == 0}　こんな感じでブロックにできる

def print_func(arg, &fun)
  puts fun.call(arg)
end

print_func(4) { |n| n * n }

# >> 16
# & のおかげで引数にブロックを入れられる

# ビンゴでした。つまりこの２つの式は等価で、&はブロックをProcオブジェクトに変換するMagic word（呪文）だったのです。
# https://melborne.github.io/2014/04/28/proc-is-the-path-to-understand-ruby/
