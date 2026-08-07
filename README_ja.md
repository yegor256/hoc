# タスク目標

<!-- hy-mt2-i18n:start -->
[English](./README.md) | [中文](./README_zh-CN.md) | **日本語** | [Español](./README_es.md)
<!-- hy-mt2-i18n:end -->

下記のMarkdown形式のデータを日本語に翻訳する。

# 厳格な制約
1. **テキストのみ出力**：コードブロックやリンク、URL、バッジ、インラインコードなど、一切のコード関連要素は含めずにテキストのみを出力する。
2. **構造の維持**：元のMarkdownの構造、インデント、見出しの階層、表、リンク、URL、バッジ、コードブロック、インラインコードを一切変更しない。
3. **選択的翻訳**：ユーザーが見ることのできる自然言語の内容（本文、見出し、説明文、表のテキスト）のみを翻訳する。
4. **変更禁止**：コードタグ、キー名、変数プレースホルダー（{{var}}、${var}、%s、%dなど）、コマンド例、ファイルパス、プロジェクト名、API名、パッケージ名、モデル名、識別子、コード記号などは、原文に対応する翻訳がある場合を除き、**絶対に**翻訳や変更してはならない。

# データ入力
ソースファイル：README.md

Markdown内容：
[![ここではEOの原則が守られています](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![DevOps By Rultor.com](https://www.rultor.com/b/yegor256/hoc)](https://www.rultor.com/p/yegor256/hoc)
[![RubyMineを推奨します](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![rake](https://github.com/yegor256/hoc/actions/workflows/rake.yml/badge.svg)](https://github.com/yegor256/hoc/actions/workflows/rake.yml)
[![Gemのバージョン](https://badge.fury.io/rb/hoc.svg)](https://badge.fury.io/rb/hoc)
[![メンテナンス性](https://api.codeclimate.com/v1/badges/4302208cf578d101143e/maintainability)](https://codeclimate.com/github/yegor256/hoc/maintainability)
[![テストカバレッジ](https://img.shields.io/codecov/c/github/yegor256/hoc.svg)](https://codecov.io/github/yegor256/hoc?branch=master)
[![Hits-of-Code](https://hitsofcode.com/github/yegor256/hoc)](https://hitsofcode.com/view/github/yegor256/hoc)

これは、ソースコードリポジトリ内でHits-of-Code指標を
計算するためのコマンドラインツールです（現在はGit 2+およびSubversion 1.7+をサポートしています）。
Hits-of-Code指標については、このブログ記事で詳しくご覧いただけます：
[SLoCの代わりにHits-of-Codeを使う](https://www.yegor256.com/2014/11/14/hits-of-code.html)。

また、リポジトリ内にバッジを表示したい場合は、
[Valentin Brandl](https://www.vbrandl.net/)が運営する[hitsofcode.com](https://hitsofcode.com)も利用できます。

まずはインストールしてください：

```bash
$ gem install hoc
```

ローカルで実行し、出力結果を確認してください：

```bash
$ hoc --help
```

Subversionの統計を取得するには、
[diffstat](https://sourceforge.net/projects/mingw/files/MSYS/Extension/diffstat/)をインストールしておく必要があります。

## 貢献方法

[これらのガイドライン](https://www.yegor256.com/2014/04/15/github-guidelines.html)をご確認ください。
プルリクエストを送信する前に、ビルド結果が正常であることを確認してください。
そのためには、[Ruby](https://www.ruby-lang.org/en/) 2.3+と[Bundler](https://bundler.io/)をインストールしておく必要があります。次に以下のコマンドを実行してください：

```
$ bundle update
$ bundle exec rake
```

問題なくエラーメッセージも表示されなければ、プルリクエストを送信してください。
