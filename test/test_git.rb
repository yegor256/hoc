# SPDX-FileCopyrightText: Copyright (c) 2014-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'minitest/autorun'
require 'hoc/git'
require 'tmpdir'

# Git test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2014-2025 Yegor Bugayenko
# License:: MIT
class TestGit < Minitest::Test
  def test_parsing
    skip if Gem.win_platform?
    Dir.mktmpdir 'test' do |dir|
      raise unless system("
        set -e
        set -x
        cd '#{dir}'
        git init --quiet .
        git config user.email test@zerocracy.com
        git config user.name test
        echo 'hello, world!' > test.txt
        git add test.txt
        git commit -qam 'add line'
        echo 'good bye, world!' > test.txt
        git commit -qam 'modify line'
        rm test.txt
        git add test.txt
        git commit -qam 'delete line'
      ")
      hits = HOC::Git.new(dir, [], '', '2000-01-01',
                          Time.now.strftime('%Y-%m-%d')).hits
      assert_equal 1, hits.size
      assert_equal 4, hits[0].total
    end
  end

  def test_parsing_with_empty_git
    skip if Gem.win_platform?
    Dir.mktmpdir 'test' do |dir|
      raise unless system("
        set -e
        cd '#{dir}'
        git init --quiet .
      ")
      hits = HOC::Git.new(dir, [], '', '2000-01-01',
                          Time.now.strftime('%Y-%m-%d')).hits
      assert_equal 1, hits.size
      assert_equal 0, hits[0].total
    end
  end

  def test_ignores_binary_files
    skip if Gem.win_platform?
    Dir.mktmpdir 'test' do |dir|
      raise unless system("
        set -e
        cd '#{dir}'
        git init --quiet .
        git config user.email test@zerocracy.com
        git config user.name test
        dd if=/dev/urandom of=test.dat bs=1 count=65536
        git add test.dat
        git commit -qam 'binary file'
        dd if=/dev/urandom of=test.dat bs=1 count=65536
        git add test.dat
        git commit -qam 'binary file modified'
      ")
      hits = HOC::Git.new(dir, [], '', '2000-01-01',
                          Time.now.strftime('%Y-%m-%d')).hits
      assert_equal 1, hits.size
      assert_equal 0, hits[0].total
    end
  end
end
