Feature: Command Line Processing
  As a source code writer I want to be able to
  calculate my hits-of-code metric

  Scenario: Help can be printed
    When I run bin/hoc with "-h"
    Then Exit code is zero
    And Stdout contains "--format"

  Scenario: Simple git repo
    Given I run bash:
    """
    set -e
    set -x
    git init .
    echo 'hello, world!' > test.txt
    git add test.txt
    git commit -m test
    """
    When I run bin/hoc with "-f int"
    Then Exit code is zero
    And Stdout contains "1"
