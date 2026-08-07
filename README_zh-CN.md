# 任务目标

<!-- hy-mt2-i18n:start -->
[English](./README.md) | **中文** | [日本語](./README_ja.md) | [Español](./README_es.md)
<!-- hy-mt2-i18n:end -->

将下方 Markdown 格式数据翻译为中文。

# 严格约束
1. **只输出译文**。不要添加任何额外的文字内容。
2. **结构锁定**：必须完全保留原有的 Markdown 数据结构、缩进、标题层级、表格、链接、URL、徽章、代码块和行内代码，不得有任何改动。
3. **选择性翻译**：仅对面向用户显示的可见自然语言内容（正文、标题、说明文字和表格文本）进行翻译。
4. **禁止修改**：**严禁**翻译或更改代码标签、键名、变量占位符（如 {{var}}、${var}、%s、%d 等）、命令示例、文件路径、项目名、API 名、包名、模型名、标识符和代码符号；除非原文已经给出了对应的译名。

# 数据输入
源文件：README.md

Markdown 内容：
[![此处遵循 EO 原则](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![DevOps 由 Rultor.com 提供](https://www.rultor.com/b/yegor256/hoc)](https://www.rultor.com/p/yegor256/hoc)
[![我们推荐使用 RubyMine](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![rake](https://github.com/yegor256/hoc/actions/workflows/rake.yml/badge.svg)](https://github.com/yegor256/hoc/actions/workflows/rake.yml)
[![Gem 版本](https://badge.fury.io/rb/hoc.svg)](https://badge.fury.io/rb/hoc)
[![可维护性](https://api.codeclimate.com/v1/badges/4302208cf578d101143e/maintainability)](https://codeclimate.com/github/yegor256/hoc/maintainability)
[![测试覆盖率](https://img.shields.io/codecov/c/github/yegor256/hoc.svg)](https://codecov.io/github/yegor256/hoc?branch=master)
[![Hits-of-Code 指标](https://hitsofcode.com/github/yegor256/hoc)](https://hitsofcode.com/view/github/yegor256/hoc)

这是一个用于计算源代码仓库中 Hits-of-Code 指标的命令行工具（目前我们支持 Git 2+ 和 Subversion 1.7+）。您可以在这篇博客文章中了解更多关于 Hits-of-Code 指标的信息：
[用 Hits-of-Code 取代 SLoC](https://www.yegor256.com/2014/11/14/hits-of-code.html)。

如果您希望在自己的仓库中添加徽章，也可以使用由 [Valentin Brandl](https://www.vbrandl.net/) 开发的 [hitsofcode.com](https://hitsofcode.com)。

首先进行安装：

```bash
$ gem install hoc
```

在本地运行该工具并查看其输出结果：

```bash
$ hoc --help
```

如果要获取 Subversion 相关的统计信息，必须先安装 [diffstat](https://sourceforge.net/projects/mingw/files/MSYS/Extension/diffstat/)。

## 如何贡献代码

请阅读[这些指南](https://www.yegor256.com/2014/04/15/github-guidelines.html)。在提交拉取请求之前，请确保您的构建结果是正常的（状态为绿色）。您需要安装 [Ruby](https://www.ruby-lang.org/en/) 2.3+ 及 [Bundler](https://bundler.io/)。之后执行以下操作：

```
$ bundle update
$ bundle exec rake
```

如果一切正常且没有出现任何错误信息，就可以提交您的拉取请求了。
