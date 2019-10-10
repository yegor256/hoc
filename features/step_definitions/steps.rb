# Copyright (c) 2014-2019 Yegor Bugayenko
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

require 'hoc'
require 'tmpdir'
require 'slop'
require 'English'

Before do
  @cwd = Dir.pwd
  @dir = Dir.mktmpdir('test')
  FileUtils.mkdir_p(@dir) unless File.exist?(@dir)
  Dir.chdir(@dir)
end

After do
  Dir.chdir(@cwd)
  FileUtils.rm_rf(@dir) if File.exist?(@dir)
end

Given(/^It is Unix$/) do
  pending if Gem.win_platform?
end

Given(/^It is Windows$/) do
  pending unless Gem.win_platform?
end

Given(/^I run bash:$/) do |script|
  FileUtils.copy_entry(@cwd, File.join(@dir, 'hoc'))
  cmd = script.split("\n").join(' && ')
  @stdout = `#{cmd}`
  @exitstatus = $CHILD_STATUS.exitstatus
  raise 'non-zero exit code' unless @exitstatus.zero?
end

When(%r{^I run bin/hoc with "([^"]*)"$}) do |arg|
  home = File.join(File.dirname(__FILE__), '../..')
  @stdout = `ruby -I#{home}/lib #{home}/bin/hoc #{arg}`
  @exitstatus = $CHILD_STATUS.exitstatus
end

Then(/^Stdout contains "([^"]*)"$/) do |txt|
  unless @stdout.include?(txt)
    raise "STDOUT doesn't contain '#{txt}':\n\n--------\n#{@stdout}\n--------\n"
  end
end

Then(/^Exit code is zero$/) do
  raise "Non-zero exit code #{@exitstatus}" unless @exitstatus.zero?
end

Given(/^I have a "([^"]*)" file with content:$/) do |file, text|
  FileUtils.mkdir_p(File.dirname(file)) unless File.exist?(file)
  File.open(file, 'w') do |f|
    f.write(text)
  end
end
