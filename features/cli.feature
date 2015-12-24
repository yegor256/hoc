Feature: Command Line Processing
  As a source code writer I want to be able to
  calculate my hits-of-code metric

  Scenario: Help can be printed
    When I run bin/hoc with "-h"
    Then Exit code is zero
    And Stdout contains "--format"

  Scenario: Simple git repo
    Given It is Unix
    Given I run bash:
    """
    set -e
    git init .
    git config user.email test@teamed.io
    git config user.name test
    echo 'hello, world!' > test.txt
    git add test.txt
    git commit -am test
    """
    When I run bin/hoc with "-f int"
    Then Exit code is zero
    And Stdout contains "1"

  Scenario: Real git repo
    Given It is Unix
    Given I run bash:
    """
    set -e
    rm -rf *
    git clone https://github.com/teamed/hoc.git .
    """
    When I run bin/hoc with "-f int"
    Then Exit code is zero
