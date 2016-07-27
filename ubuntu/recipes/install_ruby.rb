user 'ubuntu'

node.set['rvm']['installer_url'] = 'https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer'
node.set['rvm']['branch'] = 'none'
node.set['rvm']['version'] = '1.27.0'

node.set['rvm']['user_installs'] = [
  {
    :user => 'ubuntu',
    :default_ruby => 'ruby-2.1.5',
    :rubies => ['ruby-2.1.5'],
    :global_gems => [
      {
        :name => 'bundler',
        :version => '1.11.2'
      }
    ]
  }
]

include_recipe 'rvm::user'
