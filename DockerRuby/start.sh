#! /bin/bash
#chmod 755 start.sh
# fuc: source /etc/profile.d/rvm.sh && start app
# author: zhouwei
# date:2016-06-30

log_file=/home/app.log
main(){
    source /etc/profile.d/rvm.sh
    rvm use ruby 2.3.1 --default
    # /etc/init.d/crond start 
    # rm -rf /var/run/syslogd.pid&&/etc/init.d/rsyslog start
    retval=$?
    if [ $retval -eq 0 ];
    then
	cd /home&&gem install mysql2 -v '0.4.8'&&bundle install&&RAILS_ENV=staging bundle exec rake db:migrate&&bundle exec whenever --update-crontab -s environment=staging&&puma -e staging  
    else
	echo 'error'
    fi
}
main