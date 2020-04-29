# オブジェクト.メソッド（引数）：レシーバと呼んだりする。each文みたいなものはブロック付きメソッド呼び出し
# インスタンスメソッド、クラスメソッド、関数的メソッドがある

# レシーバがオブジェクトそのもの
p "10,20,30,40".split
# レシーバがクラス
p Time.now

def hello(name)
  puts "こんにちは" + name
end

# 引数を指定してメソッドを呼び出す
hello("ゆうき")

# yieldがよくわからない
# 学習：yieldは指定した値をブロックのパラメーターに渡してブロック内部を実行します。下のコードを見て学習しましょう。

def block_method
  yield "a"
  yield "b"
  yield "c"
end

block_method do |x|
  puts x
end

# 引数はキーワードとしてx: みたいにできる
