#!/bin/sh
sudo /etc/init.d/httpd stop
rvmsudo RAILS_ENV=production rake thinking_sphinx:stop
sudo git pull
rvmsudo RAILS_ENV=production bundle pack
rvmsudo RAILS_ENV=production bundle install --path vendor/cache
rvmsudo RAILS_ENV=production bundle exec rake assets:precompile
rvmsudo RAILS_ENV=production rake thinking_sphinx:configure
rvmsudo RAILS_ENV=production rake thinking_sphinx:index
sudo chown -R apache:apache .
sudo -u apache searchd --pidfile --config /var/www/Kiris/config/production.sphinx.conf
sudo /etc/init.d/httpd start
