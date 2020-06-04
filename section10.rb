# 例外処理の書き方

begin
  # 例外を発生させる可能性のある処理
rescue 事象 => exception
  # 例外の処理
  # exception.messageとかでメッセージが出力される
end

rescue Ereno::ENONET,....のような感じ、複数かける。エラークラスはP190
end
# エラーにもたくさんの種類がある

# rescureを経由することができれば、処理の途中だったら中断せずに実行してくれる。

ensure 例外関係なく毎回実行する処理
sleep 秒　秒数を開ける retryと組み合わせるともう一回試すことができる

n = Integer(val) rescue 0
# 文字がきた場合、など不適切なものを置き換えるデフォルトの役割
# エラーも全てオブジェクト。Expectationクラスのサブクラス

MyError = Class.new(Standard)
継承の書き方のパターン


