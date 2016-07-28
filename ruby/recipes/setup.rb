user 'ubuntu'

node.set['rvm']['user_installs'] = node[:rvm][:user_installs]

include_recipe 'rvm::user'
