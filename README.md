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

* ``ex1.dat``

  6列目に各生徒の総合点を加えた(6,50)の配列を出力したもの

* ``sorted_ex1.dat``
  
  6列目の総合点を降順にsortしたもの。

ヒープソートのプログラムは次を参照：[FORTRAN90によるヒープソートとバブルソート](https://slpr.sakura.ne.jp/qp/sortf90/)

* exercise2.f95