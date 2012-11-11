# Chef Bootstrap Repo

## Features

* Convenient bootstrap script for optimal first-run experience and incremental
  project updates
* Flexible knife.rb configuration that supports solo, hosted and open source
  Chef via environment variable injection
* [direnv](https://github.com/zimbatm/direnv) support which loads and unloads
  `bin/` and `script/` from your `PATH`

## Development

### Development Setup

Setting up for development should *only* require the following:

    git clone <git_url>
    cd <repo-dir>
    ./script/bootstrap  # this script will run bundle install and librarian install
    vagrant up chef
    
Then open a webbrowser and vist the chef servrer web ui

    open http://chef.vm:4040/ 
  
  1. login with default username=admin password=chefchef
  2. Create a user for yourself, 
  3. and then create a client for your user, 
  4. and then download those credentials for use with knife
  
Run knife configure to seup a knife.rb confiuration file.  It is recomended to set on in the .chef of the <repo-dir>.
  
    knife configure
    
Before being able to run the knfie commands, you will need to place the client private pem file you created thru the webui in the .chef directory.  Here is an example of a working knife.rb

    log_level                :info
    log_location             STDOUT
    node_name                ENV['USER']
    client_key               "/Users/#{ENV['USER']}/code/chef-hatch-repo/.chef/#{ENV['USER']}.pem'
    cookbook_path            '/Users/fairchild/code/chef-hatch-repo/cookbooks'
    validation_client_name   'chef-validator'
    validation_key           '/Users/fairchild/code/chef-hatch-repo/validation.pem'
    chef_server_url          'https://chef.vm'
    cache_type               'BasicFile'
    cache_options( :path => '/Users/fairchild/code/chef-hatch-repo/.chef/checksums' )

The fairchild.pem file is the privte key retrieved from the chef server webui for my user.  
The validator.pem file is what is used when creating new clients

Upload the cookbooks to the chef server

    ./script/populate_chef_server
    

### Refreshing/Updating Local Copy

Similiar to the **Development Setup**:

    git pull
    ./script/bootstrap

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make. For
example:

1. Fork the repo
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## <a name="authors"></a> Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>)

[fnichol]:      https://github.com/fnichol
[repo]:         https://github.com/fnichol/chef-bootstrap-repo
[issues]:       https://github.com/fnichol/chef-bootstrap-repo/issues
[contributors]: https://github.com/fnichol/chef-bootstrap-repo/contributors
