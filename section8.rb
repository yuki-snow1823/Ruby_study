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

# アクセスメソッド復習

# オブジェクトの内部のインスタンス変数をいじる事は、普通できない
# 内部の情報は操作できない


class HelloWorld
  def name
    @name
  end

  def name =(value) # ある種こう言うメソッド
    @name = value
  end
end

# XXX.name = value みたいな感じで使える

# ただ、こんな感じでメソッドをバンバン増やすと見辛くなる
# そこで、簡単な記述にする方法がある 

# attr_render :name 参照
# attr_writer :name 変更
# attr_accesor :name 両方

# 上の文は

class HelloWorld
  attr_accesor :name
end

# これで同じ

# 実際の使い方について
# https://qiita.com/ngron/items/dd3cd8eb8ef58bd1c1fc


# クラスメソッドについて
# クラスオブジェクトをレシーバー(.のまえ)にする

# class << クラス名 end　と言う不思議な書き方をする
# で、これが class <<self　でもいいって事

# @@ がつくのはクラス変数。そのクラスの中で全て参照できる
# 例えば、クラスメソッドで、クラス変数に何かを加算する処理をすれば、どんどん増える

class SayCount
  @@count = 0
  def SayCount.count
    @@count
  end
  def say
    @@count += 1
  end
end

Bob = SayCount.new
Bob.say
p SayCount.count # 1

# private :メソッド名　呼び出しの制限

# クラスの拡張

class 追加後 < 追加前

  super(hello)
  puts "a"

end
# helloとaが呼ばれる

class 追加前
  def hello(name)
     "Hello #{name}"
  end
end

# https://www.javadrive.jp/ruby/inherit/index1.html
# 継承の例

# superはvueのスロットみたいに、親の内容入れつつ何か書き加える時に使えそう

# メソッドの名前変更
# alias 別名 メソッド名
# alias :別名 :メソッド名
# 再定義可能

# 特異クラス

class << str1
  def hello
  end
end

# str.hello

# ※moduleは継承できないし、インスタンスをもてない

# extendを使うと、モジュールを全てオブジェクトにmixinできる

# オブジェクト指向
# ただのデータではなく、情報を持ったデータ、整理がしやすくなり、まとまりとしてあることで構造化できる

# カプセル化できる。外部から呼び出せない、

# ポリモーフィズム
# 同じメソッドでも違うオブジェクトで起こす現象が変わる
