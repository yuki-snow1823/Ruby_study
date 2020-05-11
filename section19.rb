# 文字には文字データとそのデータの文字コードがある
# 後者をエンコーディングという

# 内部エンコーディング：入力　外部エンコーディング：出力

"こんにちは".encoding

str = "hoge"

# str.encode("ECP-JP") エラーになる
# p str.encoding

# compatible　文字コードの互換性をチェック

puts Encoding.list


# 1
# encoding: utf-8

def to_utf8(str_euc, str_sjis)
  ## encodeメソッドを使ってそれぞれUTF-8に変換してから連結します
  str_euc.encode("UTF-8") + str_sjis.encode("UTF-8")
end

## 以下のように実行します。
str_euc  = "こんにちは".encode("EUC-JP")
str_sjis = "さようなら".encode("Shift_JIS")

puts to_utf8(str_euc, str_sjis)


# encoding: utf-8

## Shift_JISでsjis.txtに出力します
File.open("sjis.txt","w:Shift_JIS") do |f|
  f.write("こんにちは")
end

## sjis.txtを開いて、それをUTF-8で出力します
File.open("sjis.txt","r:Shift_JIS") do |f|
  str = f.read
  ## strはShift_JISなので、putsで出力する際にUTF-8にします
  puts str.encode("UTF-8")
end
