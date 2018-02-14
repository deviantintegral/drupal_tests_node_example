pipeline {
  agent {
    docker {
      image 'andrewberry/drupal_tests:0.2.0'
    }
    
  }
  stages {
    stage('') {
      agent any
      steps {
        sh '''#!/bin/bash

./test.sh node'''
      }
    }
  }
}