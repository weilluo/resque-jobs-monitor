app = search(:aws_opsworks_app).first

directory "/srv/apps" do
  owner node[:deploy_user]
  group node[:deploy_user]
  mode '0755'
  action :create
end

directory "/srv/bin" do
  owner node[:deploy_user]
  group node[:deploy_user]
  mode '0755'
  action :create
end

directory "/srv/.ssh" do
  owner node[:deploy_user]
  group node[:deploy_user]
  mode '0755'
  action :create
end

ssh_key_file = "/srv/.ssh/#{app['shortname']}"
ssh_key_wrapper = "#{ssh_key_file}_wrapper"

file ssh_key_file do
  content app['app_source']['ssh_key']
  mode '0400'
  owner node[:deploy_user]
  group node[:deploy_user]
  action [:delete, :create]
end

file ssh_key_wrapper do
  mode '0770'
  owner node[:deploy_user]
  group node[:deploy_user]
  content <<-EOS.gsub(/^ {4}/, '')
    #!/bin/sh
    exec ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i "#{ssh_key_file}" "$@"
  EOS
  action [:delete, :create]
end

template "/srv/bin/lift_jobs_monitor.sh" do
  source "lift_jobs_monitor.sh.erb"
  owner node[:deploy_user]
  group node[:deploy_user]
  mode '0700'
  variables({app_path: "/srv/apps/#{app['shortname']}", deploy_user: node[:deploy_user]})
end
