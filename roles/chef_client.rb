name "chef_client"
description "A Chef client"

run_list(
  "recipe[chef-client::config]",
  "recipe[chef-client::delete_validation]",
  "recipe[chef-client]"
)

default_attributes :chef_client => { :server_url => false, :backup_path => "/var/lib/chef/backup" }