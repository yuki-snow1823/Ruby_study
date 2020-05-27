# オブジェクト思考にはクラスの概念がある
# Rubyのオブジェクトは例外なく何かのクラスに所属している
# ほぼオブジェクト＝インスタンス

# newで作成できる
ary = Array.new
# たい焼きの型とたい焼きのイメージ

p ary
p ary.class
p ary.instance_of?(Array) # true

# 時計クラスから継承をしてアナログ時計、デジタル時計を作る
# 継承元をスーパークラス、継承先をサブクラスと言う
p ary.is_a?(Object)

# メソッドみたいにクラスも自分で作るということ
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

# こんな感じで複数指定もできる
# https://teratail.com/questions/233398

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
# 入れ込むことができる
class Hoge
  class << self
    def hoge
      puts "hoge"
    end
  end
end
Hoge.hoge # => hoge

# 定数（一度入れたら変更不可、大文字開始）の参照
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
    puts "#{self} + hello #{name}"
  end
  # module_function :hello 外部に公開することで使える状態にしている
end

include HelloModule
p HelloModule::Version
p Version  #インクルードしているからこれだけでもでる

# extendメソッド

str = "楽しいRuby"
str.extend(HelloModule)
p str.hello("bob")


# オブジェクト指向の特徴
# カプセル化、ポリモーフィズム：いろんなメソッドがいろんなオブジェクトで別の結果を生み出すこと

require "net/http"
require "uri"
url = URI.parse("http://www.ruby-lang.org/ja/") # データを解析して集合にする
http = Net::HTTP.start(url.host, url.port)
doc = http.get(url.path)
puts doc.body
