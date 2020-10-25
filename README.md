# 概要

## exercise1.f95

### 概要

課題１のプログラム。
sample.datに記載された50人の生徒の5教科それぞれの点数を入力として使う。

### 実行方法

```bash

$ gfortran exercise1.f95 -o exercise1
$ ./exercise1 < sample.dat

```

以上を実行すると、``ex1.dat``と``sorted_ex1.dat``が生成される。

### 出力について

* ``ex1.dat``<br>

  6列目に各生徒の総合点を加えた(6,50)の配列を出力したもの

* ``sorted_ex1.dat``<br>
  
  6列目の総合点を降順にsortしたもの。

### ヒープソートについて

ヒープソートのプログラムは次を参照：[FORTRAN90によるヒープソートとバブルソート](https://slpr.sakura.ne.jp/qp/sortf90/)

## exercise2.f95

### 概要

課題2のプログラム。
sample.datに記載された50人の生徒の5教科それぞれの点数を入力として使う。

### 実行方法

```bash

$ gfortran exercise2.f95 -o exercise2
$ ./exercise2 < sample.dat

```

以上を実行すると、``ex2.dat``が生成される。

### 出力について

* ``ex2.dat``<br>
  各教科の平均と標準偏差が出力されたファイル



## exercise3.f95

### 概要

課題3のプログラム。
sample.datに記載された50人の生徒の5教科それぞれの点数を入力として使う。

### 実行方法

```bash

$ gfortran exercise3.f95 -o exercise3
$ ./exercise3 < sample.dat

```

以上を実行すると、``ex3_hist.dat``と``ex3_sum_hist.dat``, ``ex3_for_python.dat``が生成される。

### 出力について

まず本課題の"fortranでヒストグラムを作成せよ"という表現がよくわからない。fortranでヒストグラムを画像出力ほんとにさせるんですか？gnuplotじゃないんですか？gnuplotって別にfortranではないし、pythonのmatplotlibのほうが格段楽だからpythonでやっていいよね。



* ``ex3_hist.dat``<br>
  １列目が点数、2列目以降が各教科の各点数の人数

* ``ex3_sum_hist.dat``<br>
  １列目が点数、2列目以降が各生徒の合計点の人数

* ``ex3_for_python.dat``<br>
  ex1.datの間のカンマをとったもの。
  make_histgram.ipynbをgooglecolabとかで開いて、ex3_for_python.datをアップロードし、実行してくれればヒストグラムが見れると思います。