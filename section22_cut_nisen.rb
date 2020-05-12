require "cgi/util"
htmlfile = "nisendouka.html"
textfile = "nisendouka.txt"

html = File.read(htmlfile)

File.open(textfile, "w") do |f|
  in_header = true
  html.each_line do |line|
    if in_header && /<div class="main_text">/ !~ line
      next
    else
    # 本文までの部分が終わりましたよということ
      in_header = false
    end
    break if /<div class="bibliographical_information">/ =~ line
    line.gsub!(/<[^>]+>/,"")
    # 正規表現にマッチするものを全く何もないもので置き換える
    # 上の条件になるまで下の処理を繰り返す
    esc_line = CGI.unescapeHTML(line)
    f.write line
  end
end

# 成功
