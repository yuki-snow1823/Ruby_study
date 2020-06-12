# do end　までのことをブロックと呼ぶ

sum = ["配列"]
outcome = {"参加費" => 1000,"ストラップ代" => 500}

outcome.each do |*pair|
  p pair
end
p sum

# each_XXという種類が多い
# *ブロック変数で結果を配列に入れてくれる

# 引数に&をつけたものをproc引数といい、ブロックを入れることができる

x = 1
y = 1
ary = [1 , 2 , 3]

ary.each do |x|
  y = x
end

p [x,y]

# arr.sort {|a,b| a.length<=>b.length}のように、ブロック変数と条件を書くことで、そのように並び替えることができる
# xは初期値のままで更新されないが、yはxに最後に入った3となる。（xは初期化の１がそのまま入っている）
# yの初期化をなくすとちなみにエラーを起こす。ブロック変数は外では呼べない


# sort_byの方が処理が短くなる

# def total(from,to)
#   result = 0
#   from.upto do |num|
#     if block_given?
#     else
#   end
# end

# yieldを使うとブロック変数に引数渡せるのかも
# next redo breakにはデフォルト値の設定ができる

# Procを使うことで、ブロックをオブジェクトとして持ち運べる
