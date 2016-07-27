user 'ubuntu'

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
