# Copyright (c) 2014-2023 Yegor Bugayenko
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
require 'hoc'
require 'tmpdir'
require 'slop'

# HOC main module test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2014-2023 Yegor Bugayenko
# License:: MIT
class TestHOC < Minitest::Test
  def test_basic_git
    skip if Gem.win_platform?
    Dir.mktmpdir 'test' do |dir|
      raise unless system("
        set -e
        cd '#{dir}'
        git init .
        git config user.email test@teamed.io
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
