# オブジェクト思考にはクラスの概念がある
# Rubyのオブジェクトは例外なく何かのクラスに所属している
# ほぼオブジェクト＝インスタンス

# newで作成できる
ary = Array.new

p ary
p ary.class
p ary.instance_of?(Array)

# 時計クラスからアナログ、デジタルを継承する
# 継承元をスーパークラス、継承先をサブクラスと言う
p ary.is_a?(Object)

class HelloWorld
  # newをすると呼び出される、引数を渡さなければRubyになる
  def initialize(myname = "Ruby")
    @name = myname
  end

  # インスタンス「を作り出す」メソッド
  def hello
    puts "Hello World. I am #{@name}"
  end
end

# bobのHelloWorldクラス
bob = HelloWorld.new("Bob")

# これはnewまでが含まれているから、putsとかつけなくていい
bob.hello
