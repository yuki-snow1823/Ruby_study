pattern = Regexp.new(ARGV[0]) # 入力された一つ目
filename = ARGV[1] # 2つめ

file = File.open(filename) do |file|
  file.each do |line|
    if pattern =~line #くっついているところに意味がある
      print line
    end
  end 
end

# do |file|のおかげでcloseしなくても良くなった（？）

# ruby simple_grep.rb '二銭銅貨' nisendouka.txt | wc
# 1行に複数含まれる場合を考慮していないから、正確とは言えない
