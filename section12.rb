# Numericクラスにも整数、不動小数点数、有理数、無理数などがある

# 分母分子の取り出し方
a = Rational(2,5)
b = Rational(1,3)
p [a,b]
c = a + b
p c
c.to_f # 少数に。floatのこと
# 分母、分子の順
p [c.numerator, c.denominator]

# integerとfloatを計算するとfloatになる

