# 配列の定義：いくつかのオブジェクトを順序付きで格納したオブジェクト
names = ["yuki","horikoshi"]
puts names.size #含まれているオブジェクトの数

names.each do |f|
  puts f
end

# ハッシュの定義 シンボルや文字列をキーにしてオブジェクトを格納する
# :name のようなものをシンボルといい、ラベルのような役割
address1 = {name: "yuki"}

# 上と同義
address2 = {:name => "yuki"}

puts (address1[:name])
puts (address2[:name]) #Railsでparamsとかで取り出した時と考え方は同じ

address3 = {:name => "yuki", :kanzi => "優希"}

address3.each do |key, value|
  puts "#{key}：#{value}"
end

# 正規表現はマッチングするとその位置を返してくれる /Ruby/iの場合は大文字小文字を対象としない
puts /Ruby/ =~ "yet anothe Ruby hacker"

# =~ 一致する場所
# /i 英語の大文字小文字を判断しない
# だから、if /aaa/ =~ AAAとかすれば、一致するものだけを取る構文ができる
# nilとfalse以外は通る
