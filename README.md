[![EO principles respected here](http://www.elegantobjects.org/badge.svg)](http://www.elegantobjects.org)
[![Managed by Zerocracy](https://www.0crat.com/badge/C3RFVLU72.svg)](https://www.0crat.com/p/C3RFVLU72)
[![DevOps By Rultor.com](http://www.rultor.com/b/yegor256/hoc)](http://www.rultor.com/p/yegor256/hoc)
[![We recommend RubyMine](http://www.elegantobjects.org/rubymine.svg)](https://www.jetbrains.com/ruby/)

[![Build Status](https://travis-ci.org/yegor256/hoc.svg)](https://travis-ci.org/yegor256/hoc)
[![Build status](https://ci.appveyor.com/api/projects/status/yww1brb4xy80jh11?svg=true)](https://ci.appveyor.com/project/yegor256/hoc)
[![Gem Version](https://badge.fury.io/rb/hoc.svg)](http://badge.fury.io/rb/hoc)
[![Dependency Status](https://gemnasium.com/yegor256/hoc.svg)](https://gemnasium.com/yegor256/hoc)
[![Code Climate](http://img.shields.io/codeclimate/github/yegor256/hoc.svg)](https://codeclimate.com/github/yegor256/hoc)
[![Test Coverage](https://img.shields.io/codecov/c/github/yegor256/hoc.svg)](https://codecov.io/github/yegor256/hoc?branch=master)

It is a command line tool to calculate Hits-of-Code metric
in a source code repository (at the moment we support Git 2+ and Subversion 1.7+).
You can read more about Hits-of-Code metric in this blog post:
[Hits-of-Code Instead of SLoC](http://www.yegor256.com/2014/11/14/hits-of-code.html).

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

## Questions?

If you have any questions about the tool, or something doesn't work as expected,
please [submit an issue here](https://github.com/yegor256/hoc/issues/new).

# How to contribute

Read [these guidelines](https://www.yegor256.com/2014/04/15/github-guidelines.html).
Make sure you build is green before you contribute
your pull request. You will need to have [Ruby](https://www.ruby-lang.org/en/) 2.3+ and
[Bundler](https://bundler.io/) installed. Then:

```
$ bundle update
$ rake
```

If it's clean and you don't see any error messages, submit your pull request.

