# seed.css

## About

sass のサンプルリポジトリです。
このリポジトリでは、下記をゴールとします。

- [x] sass への変換環境を Docker 化
- [ ] css のユーティリティフレームワークを作る

## Usage

### sass 変換環境の準備

Docker 環境がすでに構築済みであることを前提とします

##### sass 変換処理用のコンテナをビルド

for Mac, Linux user

```
make init
```

for Windows user

```
docker build -t mitake/sass .
```

##### sass の変換 (開発時)

for Mac, Linux user

```
make start
```

for Windows user

```
docker run -it --init -v `pwd`:/app -t mitake/sass /app/sass/main.scss:/app/css/app.css --watch
```

上記コマンドを実行することで、`sass/` フォルダ配下にあるファイルの変更を常に監視し、sass から css への変換を行うようになります。


##### sass の変換 (圧縮された css ファイルを生成するとき)

for Mac, Linux user

```
make build
```

for Windows user

```
docker run -it --init -v `pwd`:/app -t mitake/sass /app/sass/main.scss:/app/css/app.css --style compressed
```

上記コマンドを実行を行うとこでも css ファイルへの変換にあわせて、出力される css の minify も同時に行われますが、監視は行われません。


#### sass への変換コマンドのオプション

sass はさまざまな変換オプションが用意されています。
それらを組み合わせ使用したいときは下記フォーマット中の option 項に、好きなオプションを並べて使用してください。

```
docker run -it --init -v `pwd`:/app -t mitake/sass [option]
```

また、Docker コンテナ内にて `sass/` フォルダがマウントされる位置は、`/app/sass` になっています。


### 出力される css

TODO

DEMO: https://mitakeck.github.io/seed.css/


参照: https://tailwindcss.com/

#### class 命名規則

```
(スクリーンサイズ):(プロパティ名)
ex) lg:w-1/2 -> スクリーン幅が 1280px 以下のとき、 width を 50%(1/2) を設定する
ex) w-3/12 -> width を 25%(3/12) を設定する

スクリーンサイズ一覧: xl, lg, md, sm
```

```
(アクション):(プロパティ名)
ex) hover:bg-green -> hover したとき、background-color を green に設定する
ex) active:bg-pink -> クリックしたとき、background-color を　pink に設定する
```
