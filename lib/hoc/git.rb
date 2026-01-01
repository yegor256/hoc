# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'date'
require 'hoc/hits'

module HOC
  # Git source code base.
  class Git
    def initialize(dir, exclude, author, since, before)
      @dir = dir
      @exclude = exclude
      @author = author
      @since = since
      @before = before
    end

    def hits
      version = `git --version`.split(/ /)[2]
      raise "git version #{version} is too old, upgrade it to 2.0+" unless
        Gem::Version.new(version) >= Gem::Version.new('2.0')
      cmd = [
        "cd #{@dir} && git",
        'log', '--pretty=tformat:', '--numstat',
        '--ignore-space-change', '--ignore-all-space',
        '--ignore-submodules', '--no-color',
        '--find-copies-harder', '-M', '--diff-filter=ACDM',
        "'--author=#{@author}'",
        "'--since=#{@since}'",
        "'--before=#{@before}'",
        '--', '.',
        @exclude.map { |e| "':(exclude,glob)#{e}'" }.join(' ')
      ].join(' ')
      [
        Hits.new(
          Time.now,
          `#{cmd}`.split(/\n/).delete_if(&:empty?).map do |t|
            t.split(/\t/).take(2).map(&:to_i).inject(:+)
          end.inject(:+) || 0
        )
      ]
    end
  end
end
