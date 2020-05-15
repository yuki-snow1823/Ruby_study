pattern = Regexp.new("(.{10})("+ARGV[0]+")(.{10})") # 入力された文字と前後10字を取得する
filename = ARGV[1] # 2つめ

count = 0
# 引数できた名前のものを開きます
# fileのブロック変数に中身を出します
File.open(filename) do |file|
  # 中身を一行ずつlineに出します
  file.each_line do |line|
    # patternに一致した場合（今回で言うと"二銭銅貨"）
    if pattern =~line #くっついているところに意味がある
      # 文をスキャンして、ヒットした文カウントを増やす。
      line.scan(pattern) do |s|
        puts "#{s[0]}<<#{s[1]}>>#{s[2]}"
        count += 1
      end
    end
  end 
end

puts count

# do |file|のおかげでcloseしなくても良くなった（？）

# ruby simple_grep.rb '二銭銅貨' nisendouka.txt | wc
# 1行に複数含まれる場合を考慮していないから、正確とは言えない
