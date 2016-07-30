execute 'start app' do
  user node[:deploy_user]
  group node[:deploy_user]
  command "/srv/bin/lift_jobs_monitor.sh start"
end
