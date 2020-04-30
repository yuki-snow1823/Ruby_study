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

  # インスタンス「に使う」メソッド
  def hello
    puts "Hello World. I am #{@name}"
  end
end

# bobのHelloWorldクラス
bob = HelloWorld.new("Bob")

# これはnewまでが含まれているから、putsとかつけなくていい
bob.hello


# 普通はインスタンス変数に外部からアクセスしたり、値を参照したりできない
# attr_accesor :インスタンス変数
# car.run carはレシーバー
# クラスメソッドとインスタンスメソッドの例 https://qiita.com/tbpgr/items/56eb65c0ea5882abbb07

# インスタンスメソッド
class Hoge
  def hoge
    puts "hoge"
  end
end
Hoge.new.hoge # => hoge


# クラスメソッド
class Hoge
  class << self
    def hoge
      puts "hoge"
    end
  end
end
Hoge.hoge # => hoge

# 定数の参照
class Hello
  Version = 1.1
end

p Hello::Version

class HelloCount
  # クラス変数（どのインスタンスでも呼び出せる）
  @@count = 0

  def HelloCount.count
    @@count
  end

  def initialize(myname="Ruby")
    @name = myname
  end

  def hello
    @@count += 1
    puts "Hello #{@name}"
  end

  # private :hello
  # こうすると呼び出しに制限がかかる
end

bob = HelloCount.new("Bob")
p HelloCount.count
p bob.hello # インスタンスで呼び出している
p HelloCount.count

# 継承

class RingArray < Array # こっちがスーパークラス 複数持つことはできない
  def [](i)
    idx = i & size
    super(idx) #スーパークラスの同名メソッドを呼ぶ
  end
end

wday = RingArray["日","月"]
puts wday[4],"102行目"

p Object.instance_methods #使えるもの一覧が出る

# モジュール：処理の部分だけをまとめる機能
p Math.sqrt(2) # 2の平方根

# モジュールを作る
module HelloModule
  Version =1.1

  def hello(name)
    puts "hello #{name}"
  end
  module_function :hello　# 外部に公開することで使える状態にしている
end

include HelloModule
p HelloModule::Version
p Version  #インクルードしているからこれだけでもでる
