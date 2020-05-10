# IO

# ファイルを1行ずつ読み込んで処理するというプログラムです。
# IOクラスというのは、一般的に言うファイルに相当するものです。
# ファイル操作は、リネームや削除と行ったファイル自体を操作するものと、
# ファイルの中身を読み書きする操作がありますが、後者の方を行うための物です。
# openなどでファイル名とIOクラスオブジェクトを結びつけます。

# text = io.gets
# p io

p $stdin

3.times do |i|
  $stdout.puts "#{Random.rand}" # ruby section17.rb > log.txt とすれば
  $stderr.puts "#{i+1}回出力しました。"
end
p $stdout
p $stderr

#6 データを作って標準出力だけ排出してくれる。
# だから処理を表示しつつ、エラーログだけ他の場所に残すなどのことができる。

# 標準出力と、標準エラー出力を使い分けましょうねってこと

# 実際にブラウザで開くというわけではない？
file = File.open("log.txt")
# file.close
p file.closed?

text = File.read("log.txt")
p text

# バイナリーデータとは：https://wa3.i-3-i.info/word1146.html

# 試しにioクラスのサブクラスであるfileで試してみるとこうなる
while line = file.gets # 標準入力として取るという意味だろうか
  p line.chomp!
end
p file.eof?

# 標準入力・出力に関する様々なメソッドがある

File.open("log.txt") do |io|
  p io.read(5) #場所の決め打ち
  p io.pos
  io.pos = 0
  p io
end

# バッファ プログラム内部に作られるioオブジェクトのコピー

# 1
def wc(file)
  nline = nword = nchar = 0
  File.open(file){|io|
    io.each{|line|
      words = line.split(/\s+/).reject{|w| w.empty? }
      nline += 1
      nword += words.length
      nchar += line.length
    }
  }
  puts "lines=#{nline} words=#{nword} chars=#{nchar}"
end

wc(__FILE__)

#2
def reverse(input)
  open(input, "r+") do |f|
    lines = f.readlines
    f.rewind
    f.truncate(0)
    f.write lines.reverse.join()
  end
end

p reverse(ARGV[0])
