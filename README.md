# Chef with AWS opsworks

## Monitor `resque` by using `sinatra` api:

1. is the `resque` workers started?

2. is the `queue` full?


## Custom JSON in opsworks layer

It's an example below:

    {
      "rvm": {
        "user_installs": [
          {
            "user": "ubuntu",
            "default_ruby": "ruby-2.1.5",
            "rubies": ["ruby-2.1.5"]
          }
        ]
      },
      "deploy_user": "ubuntu",
      "deploy_ruby": "ruby-2.1.5",
      "jenkins_deploy_key": "xxxx",
      "cw_mon": {
        "user": "ubuntu",
        "group": "ubuntu",
        "version": "1.2.1",
        "release_url": "http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip",
        "access_key_id": "xxx",
        "secret_access_key": "xxx",
        "options": ["--disk-space-util", "--disk-path=/", "--mem-util"],
        "cron_minutes": "5"
      }
    }

1. `rvm` more settings, reference [https://github.com/martinisoft/chef-rvm](https://github.com/martinisoft/chef-rvm)

2. `cw_mon` more settings, reference [https://github.com/alexism/cloudwatch_monitoring](https://github.com/alexism/cloudwatch_monitoring)
