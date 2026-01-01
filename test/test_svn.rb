# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'minitest/autorun'
require 'hoc/svn'
require 'tmpdir'

# Svn test.
# Author:: Yegor Bugayenko (yegor256@gmail.com)
# Copyright:: Copyright (c) 2014-2026 Yegor Bugayenko
# License:: MIT
class TestSvn < Minitest::Test
  def test_parsing
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
      hits = HOC::Svn.new(File.join(dir, 'repo')).hits
      assert_equal 1, hits.size
      assert_equal 4, hits[0].total
    end
  end

  def test_parsing_empty_repo
    skip('fails now')
    Dir.mktmpdir 'test' do |dir|
      raise unless system("
        set -e
        cd '#{dir}'
        svnadmin create base
        svn co file://#{dir}/base repo
        cd repo
      ")
      hits = HOC::Svn.new(File.join(dir, 'repo')).hits
      assert_equal 1, hits.size
      assert_equal 0, hits[0].total
    end
  end
end
