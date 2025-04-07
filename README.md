[![EO principles respected here](https://www.elegantobjects.org/badge.svg)](https://www.elegantobjects.org)
[![DevOps By Rultor.com](https://www.rultor.com/b/yegor256/hoc)](https://www.rultor.com/p/yegor256/hoc)
[![We recommend RubyMine](https://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![rake](https://github.com/yegor256/hoc/actions/workflows/rake.yml/badge.svg)](https://github.com/yegor256/hoc/actions/workflows/rake.yml)
[![Gem Version](https://badge.fury.io/rb/hoc.svg)](https://badge.fury.io/rb/hoc)
[![Maintainability](https://api.codeclimate.com/v1/badges/4302208cf578d101143e/maintainability)](https://codeclimate.com/github/yegor256/hoc/maintainability)
[![Test Coverage](https://img.shields.io/codecov/c/github/yegor256/hoc.svg)](https://codecov.io/github/yegor256/hoc?branch=master)
[![Hits-of-Code](https://hitsofcode.com/github/yegor256/hoc)](https://hitsofcode.com/view/github/yegor256/hoc)

It is a command line tool to calculate Hits-of-Code metric
in a source code repository (at the moment we support Git 2+ and Subversion 1.7+).
You can read more about Hits-of-Code metric in this blog post:
[Hits-of-Code Instead of SLoC](http://www.yegor256.com/2014/11/14/hits-of-code.html).

You can also use [hitsofcode.com](https://hitsofcode.com) by
[Valentin Brandl](https://www.vbrandl.net/), if you want to have a badge
in your repo.

Install it first:

```bash
$ gem install hoc
```

Run it locally and read its output:

```bash
$ hoc --help
```

For Subversion statistics you must have
[diffstat](http://sourceforge.net/projects/mingw/files/MSYS/Extension/diffstat/)
installed.

## How to contribute

Read [these guidelines](https://www.yegor256.com/2014/04/15/github-guidelines.html).
Make sure your build is green before you contribute
your pull request. You will need to have [Ruby](https://www.ruby-lang.org/en/) 2.3+ and
[Bundler](https://bundler.io/) installed. Then:

```
$ bundle update
$ bundle exec rake
```

If it's clean and you don't see any error messages, submit your pull request.
