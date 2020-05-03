# 例外処理の書き方

begin
  例外を発生させる可能性のある処理
rescue => exception
  例外の処理
end

ensure 例外関係なく毎回実行する処理
sleep 秒　秒数を開ける retryと組み合わせるともう一回試すことができる

# エラーも全てオブジェクト。Expectationクラスのサブクラス
