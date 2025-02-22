# (The MIT License)
#
# SPDX-FileCopyrightText: Copyright (c) 2014-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT
Feature: Git repo processing
  As a source code writer I want to be able to
  calculate my hits-of-code metric

  Scenario: Simple git repo
    Given It is Unix
    Given I run bash:
      """
      git init --quiet .
      git config user.email test@zerocracy.com
      git config user.name test
      echo 'hello, world!' > test.txt
      git add test.txt
      git commit -qam test
      """
    When I run bin/hoc with "-f int"
    Then Exit code is zero
    And Stdout contains "1"

  Scenario: Real git repo
    Given I run bash:
      """
      git clone --quiet https://github.com/teamed/hoc.git hoc-repo
      """
    When I run bin/hoc with "-f int -d hoc-repo"
    Then Exit code is zero
