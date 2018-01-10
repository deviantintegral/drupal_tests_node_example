# Example implementation of Drupal Tests on CircleCI

[drupal_tests](https://github.com/deviantintegral/drupal_tests) enables quick,
easy, and repeatable tests for individual Drupal modules. While it can replace
the Drupal testbot for projects outside of Drupal.org, it's most appropriate
for private modules shared among multiple sites or an internal distribution.

This repository shows how to run module tests, using the existing tests for the
Drupal 8 node module. As well, a sample Behat test has been added to the node
module demonstrate Behat tests and screenshot capture.

This repository also overrides the default variable for the module name, as
I didn't want to simply call this GitHub repository 'node'.

Walk through the notes below to see how this works!

# Commits of note

1. [f95125](https://github.com/deviantintegral/drupal_tests_node_example/commit/f9512538d376024fcd2639133c5c9201a467fee8)
   shows the files that were added after running setup.sh. At the time, `0.2.0`
   was the newest tag of drupal_tests.
1. [3d83dc](https://github.com/deviantintegral/drupal_tests_node_example/commit/3d83dcfc7ff2450734f20aad281ea00ac82df029)
   shows overriding test commands.
1. [75374c](https://github.com/deviantintegral/drupal_tests_node_example/commit/75374cd26789be447337b30d207096680dcae308)
   shows a basic Behat test viewing a node.

# CircleCI jobs of note

1. [#36](https://circleci.com/gh/deviantintegral/drupal_tests_node_example/36)
   shows running Unit and Kernel tests, with all passing. Every job saves the
   [composer.lock](https://36-116866433-gh.circle-artifacts.com/0/var/www/html/artifacts/composer.lock)
   file so exact versions in tests can be reproduced later if needed.
1. [#37](https://circleci.com/gh/deviantintegral/drupal_tests_node_example/37)
   shows code quality checks, including Drupal coding standards which the Node
   module currently fails.
    * The [artifacts](https://circleci.com/gh/deviantintegral/drupal_tests_node_example/37#artifacts/containers/0)
      of the job contain static HTML reports with complexity, probable bugs,
      and other reports. For example, we can see that the
      [Drupal\node\Plugin\Search\NodeSearch](https://37-116866433-gh.circle-artifacts.com/0/var/www/html/artifacts/phpmetrics/violations.html)
      is a good candidate for refactoring.
1. [#38](https://circleci.com/gh/deviantintegral/drupal_tests_node_example/38)
   shows the results of our Behat tests.
    * The [artifacts](https://circleci.com/gh/deviantintegral/drupal_tests_node_example/38#artifacts/containers/0)
      of the job contain screenshots of each step. Each feature is combined
      into one long image to easily scroll through.
1. [#39](https://circleci.com/gh/deviantintegral/drupal_tests_node_example/39)
   shows code coverage results from Unit and Kernel tests. Code coverage is
   only generated if the prior Unit and Kernel test job passes.
     * The [artifacts](https://circleci.com/gh/deviantintegral/drupal_tests_node_example/39#artifacts/containers/0)
       of the job contain both the XML and HTML output from PHP unit. The
       [coverage dashboard](https://39-116866433-gh.circle-artifacts.com/0/var/www/html/artifacts/coverage-html/dashboard.html)
       shows good classes to target for testing.
