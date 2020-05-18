# Unixのgrepコマンドもどきを作る＋コマンドラインからのデータ入力を学習する
# ARGVというものを使うと、コマンドラインから引数を渡すことができる
puts "最初の引数：#{ARGV[0]}"

name = ARGV[0]

puts "こんにちは" + name

# 例えばファイルを開いて中身を出力するプログラムも作ることができる
pattern = Regexp.new(ARGV[0]) # 入力された一つ目
filename = ARGV[1] # 2つめ。少しでも同じ表現があればその行が出力される

file = File.open(filename)
file.each do |line|
  if pattern =~ line #くっついているところに意味がある
    print line
  end
end 
file.close

# Railsなどでよくでてきたメソッド
def hello
  puts "こんにちは"
end
hello()

# requireを使えば、他のファイルのメソッドも呼び出せる
## ppメソッドはオブジェクトに対して使った時に改行をして見やすくしてくれる
