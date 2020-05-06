# 文字列クラス

# 特殊文字
# \t タブ \n 改行 

p "\cx" # control + x　を表す。キーを押した時とかに使えそう
p desc = %Q{Rubyの文字列には''も""も使えます}

# ヒアドキュメント
json = <<'EOS'
{
  "language": "Ruby"
}
EOS

puts json # 形が見やすい

# sprintfは整形した文字列をオブジェクトで返す
p sprintf("%#b", 10) #=> "0b1010"　接頭辞0bが付く
p "1010".to_i(2) #こうもできる
p 10.to_s(2) #その逆

p "配列のように番号を指定もできる"[0..1]
# 文字コードがそれぞれの文字に設定してある

# 文字の置換
str = "abcde"
str[2,1] = "あ" # 2文字目から一つあにする
p str

# Enumeratorクラスについて
# each_lineなどのこと .mapなどを使って配列にすることもできる

# 入力文字に関してコードなどを変更するnfkクラスというものがある

# 練習問題
str = "Ruby is an object oriented programming language"
ary = str.split #だけ
p ary

str = "Ruby is an object oriented programming language"
ary = str.split
# 引数なし
p ary.sort

str = "Ruby is an object oriented programming language"
ary = str.split
p ary.sort_by{|s| s.downcase }

=begin

each_char {|cstr| block } -> self[permalink][rdoc]
each_char -> Enumerator
文字列の各文字に対して繰り返します。
たとえば、
"hello世界".each_char {|c| print c, ' ' }
"hello世界".each_char {|c| print c, ' ' }
は次のように出力されます。
h e l l o 世 界

=end

str = "Ruby is an object oriented programming language"
count = Hash.new
str.each_char do |c|
  count[c] = 0 unless count[c]
  count[c] += 1
end
count.keys.sort.each do |c|
  printf("'%s': %s\n", c, "*" * count[c])
  # c　を　"*" * count[c]　に置き換える　出力さき、フォーマットされるもの、フォーマットしたものの準　第三引数：条件、第一引数。出力の仕方って感じ
  #　第二引数を第三引数の条件で第一引数のように出せって感じ
end
# gsub　置き換え

def kan2num(string)
  digit4 = digit3 = digit2 = digit1 = "0"
  # 初期化 区切りをくっつけて計算するような感じ
  # 要復習

  #　オブジェクトのコピーを作成
  nstring = string.dup

  # 置き換える条件
  nstring.gsub!(/一/, "1")
  nstring.gsub!(/二/, "2")
  nstring.gsub!(/三/, "3")
  nstring.gsub!(/四/, "4")
  nstring.gsub!(/五/, "5")
  nstring.gsub!(/六/, "6")
  nstring.gsub!(/七/, "7")
  nstring.gsub!(/八/, "8")
  nstring.gsub!(/九/, "9")

  # 独立して千とかの感じが出てきた場合の対応
  # $ 行末。文字列の末尾や改行文字の直前の位置にマッチします。改行自身は含 みません。
  if nstring =~ /((\d)?千)?((\d)?百)?((\d)?十)?(\d)?$/
    if $1
      digit4 = $2 || "1"
    end
    if $3
      digit3 = $4 || "1"
    end
    if $5
      digit2 = $6 || "1"
    end
    digit1 = $7 || "0"
  end

  return (digit4+digit3+digit2+digit1).to_i
end
