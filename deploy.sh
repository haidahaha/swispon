#!/bin/bash

ssh ubuntu@52.5.161.114 << EOF
    cd /home/ubuntu
    git init
    git remote rm origin
    git remote add origin git@github.com:haidahaha/swispon.git
    git checkout .
    git pull origin master
    git checkout master
    RAILS_ENV=production bundle install
    RAILS_ENV=production bundle exec rake db:migrate
    chown -R rails:www-data /home/ubuntu
EOF
