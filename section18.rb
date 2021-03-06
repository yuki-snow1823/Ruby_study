# ファイルの名前や属性に関する部分を扱う

# 名前の変更 directory/ファイル名にすれば移動も一緒に行ってくれる
# File.rename("log.txt", "change.txt")

=begin

def copy (from, to)
  # ファイルを開いた上でinputの方に渡す。
  File.open(from) do |input|
    # wは書き込みモードで開くということ
    File.open(to, "w") do |output|
      # outputにinputのものを書きこむ感じ
      # つまりopenはこれから作る存在しないものもopenできる。（Wしているから）
      # 書き込まれている前提で開くモード
      # これがないと開くファイルが存在しないというエラーになる。
      output.write(input.read)
    end
  end
end

copy("change.txt","log2.txt")

=end

# 上と同義
# ライブラリを読み込む
require "fileutils"
FileUtils.cp("change.txt","log2.txt")


# ディレクトリの操作+復習
p Dir.pwd
Dir.chdir("/Users/yuki/Desktop/プログラミング/Ruby系")
Dir.chdir("/Users/yuki/Desktop/プログラミング/Ruby系/たのしいRuby")
io = File.open("log.txt")
io.close
p Dir.pwd

# ディレクトリを開いてファイル名を出力させる
dir = Dir.open("../たのしいRuby")
while name = dir.read
  # p name
end
dir.close

# ワイルドカードなど。ファイル名を全て取得できる
# p Dir.glob("*.rb")


# ファイルの情報
p File.stat("section17.rb").ctime #いろんなキーがある。


# ファイルの許可モードの設定
# 8進数表記で行っているから3ビットは4桁で表す
File.chmod(0755,"section17.rb")

# ライブラリの紹介
# find そのディレクトリ以下のファイルのパスを渡す

# テンポラリファイル＝一時的なファイル

# 練習問題
def print_libraries
  $:.each do |path|
    # パスがディレクトリならばtrue => 今回は、でなければ次
    next unless FileTest.directory?(path)
    Dir.open(path) do |dir|
      dir.each do |name|
        if name =~ /\.rb$/i
          # このiが謎？
          puts name
        end
      end
    end
  end
end

print_libraries

require "find"

def du(path)
  result = 0
  Find.find(path){|f|
    if File.file?(f)
      result += File.size(f)
    end
  }
  printf("%d %s\n", result, path)
  return result
end

du(ARGV[0] || ".")
