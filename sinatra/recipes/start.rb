home = "/home/#{node[:deploy_user]}"

execute 'start app' do
  user node[:deploy_user]
  group node[:deploy_user]
  command "/#{home}/bin/lift_jobs_monitor.sh start"
end
