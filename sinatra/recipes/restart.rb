app = search(:aws_opsworks_app).first
home = "/home/#{node[:deploy_user]}"
app_path = "/#{home}/apps/#{app['shortname']}"
ssh_key_file = "/#{home}/.ssh/#{app['shortname']}"
ssh_key_wrapper = "#{ssh_key_file}_wrapper"

git app_path do
  repository app['app_source']['url']
  user node[:deploy_user]
  group node[:deploy_user]
  ssh_wrapper ssh_key_wrapper
  action :sync
end

execute 'bundle install' do
  user node[:deploy_user]
  group node[:deploy_user]
  cwd app_path
  command %Q[bundle install --gemfile #{app_path}/Gemfile --deployment --quiet --without development test]
end

execute 'restart app' do
  user node[:deploy_user]
  group node[:deploy_user]
  command "/#{home}/bin/lift_jobs_monitor.sh restart"
end
