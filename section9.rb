演算子

name = "Ruby"
if var
  name = var
end

上のプログラムは以下と同じ
name = var || "Ruby"

item = nil
if ary
  item = ary.first
end

同義
item = ary && ary.first
# 同義、短く書ける
item = ary&.first

条件 ? 式1 : 式2
条件演算子という

範囲演算子
数列を作り出す
(1..10).to_a

# 演算子が複数出てきて自身のない場合は、()をつかう 

# 範囲演算子
p (1..10).to_a
p (1...10).to_a # 1個手前まで、もちろん文字列でも対応している
