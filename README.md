[![Made By Teamed.io](http://img.teamed.io/btn.svg)](http://www.teamed.io)
[![DevOps By Rultor.com](http://www.rultor.com/b/teamed/hoc)](http://www.rultor.com/p/teamed/hoc)

[![Build Status](https://travis-ci.org/teamed/hoc.svg)](https://travis-ci.org/teamed/hoc)
[![Build status](https://ci.appveyor.com/api/projects/status/yww1brb4xy80jh11?svg=true)](https://ci.appveyor.com/project/yegor256/hoc)

[![Gem Version](https://badge.fury.io/rb/hoc.svg)](http://badge.fury.io/rb/hoc)
[![Dependency Status](https://gemnasium.com/teamed/hoc.svg)](https://gemnasium.com/teamed/hoc)
[![Code Climate](http://img.shields.io/codeclimate/github/teamed/hoc.svg)](https://codeclimate.com/github/teamed/hoc)
[![Coverage Status](https://coveralls.io/repos/teamed/hoc/badge.svg)](https://coveralls.io/r/teamed/hoc)

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

## Questions?

If you have any questions about the tool, or something doesn't work as expected,
please [submit an issue here](https://github.com/teamed/hoc/issues/new).

## How to contribute?

Fork the repository, make changes, submit a pull request.
We promise to review your changes same day and apply to
the `master` branch, if they look correct.

Please run Rake build before submitting a pull request (make sure you
have [bundler](http://bundler.io/) installed):

```
$ bundle install
$ rake
```

Make sure you're using Ruby 2.0+.

