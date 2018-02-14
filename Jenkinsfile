node {
    checkout scm
    docker.image('mariadb:10.3').withRun('-e "MYSQL_ALLOW_EMPTY_PASSWORD=1"') { c ->
        docker.image('mariadb:10.3').inside("--link ${c.id}:db") {
            /* Wait until mysql service is up */
            sh 'while ! mysqladmin ping -hdb --silent; do sleep 1; done'
        }
        docker.image('selenium/standalone-chrome-debug:3.7.1-beryllium').inside("--link ${c.id}:drupal") {
            /* We should wait, but it's not simple and Drupal has to install anyways. */
        }
        docker.image('andrewberry/drupal_tests:0.2.0').inside("--link ${c.id}:db ${c.id}:webdriver") {
        sh '''#!/bin/bash
ln -s $WORKSPACE /var/www/html/modules/node
cd /var/www/html
cp $WORKSPACE/RoboFile.php .
./test-js.sh node'''
        }
    }
}
