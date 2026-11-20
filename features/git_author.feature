# SPDX-FileCopyrightText: Copyright (c) 2014-2026 Yegor Bugayenko
# SPDX-License-Identifier: MIT
Feature: Filter git commits by author
  As a source code writer I want to be able to
  calculate my hits-of-code metric for a specific author only

  Scenario: Commits by a matching author
    Given It is Unix
    Given I run bash:
      """
      git init --quiet .
      git config core.hooksPath /dev/null
      git config user.email test@zerocracy.com
      git config user.name test
      echo 'hello, world!' > test.txt
      git add test.txt
      git commit -qam test
      """
    When I run bin/hoc with "-f int --author=test"
    Then Exit code is zero
    And Stdout contains "1"

  Scenario: No commits by a missing author
    Given It is Unix
    Given I run bash:
      """
      git init --quiet .
      git config core.hooksPath /dev/null
      git config user.email test@zerocracy.com
      git config user.name test
      echo 'hello, world!' > test.txt
      git add test.txt
      git commit -qam test
      """
    When I run bin/hoc with "-f int --author=nobody"
    Then Exit code is zero
    And Stdout contains "0"
