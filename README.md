# texlive-docker

TeX Live のイメージです。
日本語と理数系のパッケージ、LuaTexが導入されています。
VSCode の開発コンテナで使用する目的で作成しています。

## 導入パッケージ一覧

```
collection-basic 
collection-fontsrecommended 
collection-langcjk 
collection-langjapanese 
collection-latex 
collection-latexextra 
collection-latexrecommended 
collection-mathscience 
collection-pictures 
collection-luatex 
```

## Docker Image
Docker Hub

```
docker pull epita/texlive:latest
```

## 注意
LuaLaTeXのフォントキャッシュ用にボリュームを使用しています。LuaLaTeXで使用する際は以下のコマンドを参考にしてください。

```
docker run -it \
  --mount type=bind,src=$(pwd),dst=/workdir \
  --mount type=volume,src=ltcache,dst=/usr/local/texlive/2023/texmf-var/luatex-cache \
  epita/texlive:0.1.2 \
  llmk a_ken7.tex
```

また、キャッシュファイルの位置に`ENV TL_VERSION 2023`と、直接バージョンを指定しています。
バージョンアップで使えなくなる可能性が高いです。
LuaLaTeXを使用しない場合は関係ありません。

## 参考文献
[TeX Live 2019 + 原ノ味フォント + llmk の Docker コンテナを作る](https://qiita.com/doraTeX/items/f40f9597763ca63daabb#%E4%BD%BF%E3%81%84%E6%96%B9)

[重点解説！ “DockerでLuaLaTeX”を遅くしない方法](https://qiita.com/zr_tex8r/items/c1ec09f4fa3a39f5e365)

[eguchi1611/texlive-ja](https://github.com/eguchi1611/texlive-ja/blob/main/README.md)



