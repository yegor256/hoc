# encoding: utf-8
#
# Copyright (c) 2014-2017 Teamed.io
# Copyright (c) 2014-2017 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require 'minitest/autorun'
require 'hoc/git'
require 'tmpdir'

# Git test.
# Author:: Yegor Bugayenko (yegor@teamed.io)
# Copyright:: Copyright (c) 2014-2017 Yegor Bugayenko
# License:: MIT
class TestGit < Minitest::Test
  def test_parsing
    skip if Gem.win_platform?
    Dir.mktmpdir 'test' do |dir|
      fail unless system("
        set -e
        cd '#{dir}'
        git init .
        git config user.email test@teamed.io
        git config user.name test
        echo 'hello, world!' > test.txt
        git add test.txt
        git commit -am 'add line'
        echo 'good bye, world!' > test.txt
        git commit -am 'modify line'
        rm test.txt
        git commit -am 'delete line'
      ")
      hits = HOC::Git.new(dir, []).hits
      assert_equal 1, hits.size
      assert_equal 4, hits[0].total
    end
  end

  def test_parsing_with_empty_git
    skip if Gem.win_platform?
    Dir.mktmpdir 'test' do |dir|
      fail unless system("
        set -e
        cd '#{dir}'
        git init .
      ")
      hits = HOC::Git.new(dir, []).hits
      assert_equal 1, hits.size
      assert_equal 0, hits[0].total
    end
  end

  def test_ignores_binary_files
    skip if Gem.win_platform?
    Dir.mktmpdir 'test' do |dir|
      fail unless system("
        set -e
        cd '#{dir}'
        git init .
        git config user.email test@teamed.io
        git config user.name test
        dd if=/dev/urandom of=test.dat bs=1 count=65536
        git add test.dat
        git commit -am 'binary file'
        dd if=/dev/urandom of=test.dat bs=1 count=65536
        git add test.dat
        git commit -am 'binary file modified'
      ")
      hits = HOC::Git.new(dir, []).hits
      assert_equal 1, hits.size
      assert_equal 0, hits[0].total
    end
  end
end
