person = Hash.new
person["name"] = "Yuki"
puts person["name"]

animal = { name: "tora"}
puts animal
puts animal[:name] #取り出す時

# 同様に値を登録するときにstoreというものが使える
# ハッシュ生成時にデフォルトを引数として渡すことができる

# keyだけを取ることも、それを配列に入れることなどもできる
word = String.new
person.each_key do |key|
  word = key
end
puts word

# 一致するキーを探す
p animal.member?(:name) 
p animal.member?("name") #false
# 同じ役割でもキーがStringなのかSymbolなのかは区別されることがわかる

# ハッシュのハッシュ
table = {"A" => {"a" => "x"}}
p table["A"]["a"]

# 練習問題(4)
def str2hash(str)
  hash = Hash.new()
  array = str.split(/\s+/)
  while key = array.shift
    value = array.shift
    hash[key] = value
  end
  return hash
end

p str2hash("bule 青 white 白\nred 赤");
