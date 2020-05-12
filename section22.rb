# テキスト処理の学習
# 青空文庫のテキストを使う

require "open-uri"

url = "https://www.aozora.gr.jp/cards/001779/files/56647_58167.html"
filename = "nisendouka.html"

# ダウンロードされる

File.open(filename, "wb") do |f|
  text = open(url, "r:shift_jis").read
  f.write text.encode("utf-8")
end

	# <div class="main_text"><br /> が本文のスタート
