# 条件判断 ifが必要
ad = ARGV[0].to_i
heisei = ad - 1988
puts heisei

a = 10
b = 20

unless a > b
  puts "条件が揃った"
end

# 条件がいくつもある場合、elsifでもいいが、参照するオブジェクトが一つならcaseで十分

tags = ["A", "IMG"] # 何かの要素を足せば最後の条件にもヒットする
tags.each do |tagname|
  case tagname
  when "P", "A"
    puts "tagのなかに要素があります".object_id # 全てのオブジェクトはidを持つ
  when "IMG"
    puts "tagのなかにIMGがあります"
  else
    puts "条件以外です"
  end
end
