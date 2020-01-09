---
date: 2020/01/09
author: u110
title: "仕様書Sample"
---

# 概要

dockerイメージから生成されるPDFファイルの検証用のドキュメントです。

# 背景

業務で利用するドキュメントをマークダウンで管理したい。
お客さんにはPDFで提供したい。
UML書きたい、管理したい。

# 実験

## PlantUML[^1]

を埋め込める

- UML例（シーケンス図)

```plantuml
Alice -> Bob: Authentication Request
Bob --> Alice: Authentication Response

Alice -> Bob: Another authentication Request
Alice <-- Bob: another authentication Response
```

[^1]: https://plantuml.com

## 数式

例えばベイズの定理

$$
P(外食する|雨降ってる) = \frac{P(外食する) P(雨降ってる|外食する)}{P(雨降ってる)}
$$

イコールを揃える時は `\begin{eqnarray}`

\begin{eqnarray}
x + y &=& 5 \label{easy_eq} \\
x &=& 2
\end{eqnarray}

## テーブル

| A | B |
|:-:|--:|
|123|456|
|あああ|いいい|


\clearpage

## コード


Goのサンプルコード

```go
package main

import (
	"fmt"
	"sync"
	"time"
)
func main() {
	arr := []int{10, 30, 5, 8, 3}
	fmt.Println("in:", arr)

	var wg sync.WaitGroup

	for _, i := range arr {
		wg.Add(1)
		go func(i int) {
			time.Sleep(time.Duration(i) * time.Millisecond)
			fmt.Println(i)
			wg.Done()
		}(i)
	}
	wg.Wait()
}
```

# 結果

便利。

# 考察

toc(Table Of Contents)とかも入れたくなるかも
pdfリーダーでは目次が対応していそう

# 参考

- markdownからPDFを生成してくれるdockerイメージ
    - https://github.com/Kumassy/docker-alpine-pandoc-ja
