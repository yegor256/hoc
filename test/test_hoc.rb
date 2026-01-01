# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'minitest/autorun'
require 'hoc'
require 'tmpdir'
require 'slop'

# HOC main module test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2014-2026 Yegor Bugayenko
# License:: MIT
class TestHOC < Minitest::Test
  def test_basic_git
    skip if Gem.win_platform?
    Dir.mktmpdir 'test' do |dir|
      raise unless system("
        set -e
        cd '#{dir}'
        git init .
        git config user.email test@zerocracy.com
        git config user.name test
        echo 'hello, world!' > test.txt
        git add test.txt
        git commit -am test
      ")
      assert HOC::Base.new(dir: '.', exclude: ['a/**'], author: '').report > 0
    end
  end

  def test_basic_svn
    skip if Gem.win_platform?
    Dir.mktmpdir 'test' do |dir|
      raise unless system("
        set -e
        cd '#{dir}'
        svnadmin create base
        svn co file://#{dir}/base repo
        cd repo
        echo 'Hello, world!' > test.txt
        svn add test.txt
        svn ci -m 'first commit'
        echo 'Bye!' > test.txt
        svn ci -m 'second commit'
        svn rm test.txt
        svn ci -m 'third commit'
        svn up
      ")
      assert HOC::Base.new(dir: File.join(dir, 'repo')).report > 0
    end
  end

  def test_fails_if_not_repo
    Dir.mktmpdir 'test' do |dir|
      assert_raises RuntimeError do
        HOC::Base.new(dir: dir).report
      end
    end
  end

  def test_fails_if_not_int
    Dir.mktmpdir 'test' do |dir|
      assert_raises RuntimeError do
        HOC::Base.new(dir: dir, format: 'text').report
      end
    end
  end
end
