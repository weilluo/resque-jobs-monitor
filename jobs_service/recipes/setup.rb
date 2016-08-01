app = search(:aws_opsworks_app).first

bash "append environment variables for LiFT Jobs Service" do
  cwd "/home/#{node[:deploy_user]}"
  group node[:deploy_user]
  user node[:deploy_user]
  code <<-EOS.gsub(/^ {4}/, '')
    echo 'export LiFT_REDIS_URL="#{app["environment"]["LiFT_REDIS_URL"]}"' >> .profile
    echo 'export RACK_ENV="#{app["environment"]["RACK_ENV"]}"' >> .profile
    echo 'export HAL_PASSWORD="#{app["environment"]["HAL_PASSWORD"]}"' >> .profile
    echo 'export HAL_USERNAME="#{app["environment"]["HAL_USERNAME"]}"' >> .profile
    echo 'export MONGO_DBNAME="#{app["environment"]["MONGO_DBNAME"]}"' >> .profile
    echo 'export MONGO_HOST="#{app["environment"]["MONGO_HOST"]}"' >> .profile
    echo 'export MONGO_PASSWORD="#{app["environment"]["MONGO_PASSWORD"]}"' >> .profile
    echo 'export MONGO_PORT="#{app["environment"]["MONGO_PORT"]}"' >> .profile
    echo 'export MONGO_USERNAME="#{app["environment"]["MONGO_USERNAME"]}"' >> .profile

    echo '#{node[:jenkins_deploy_key]}' >> .ssh/authorized_keys
  EOS
end
