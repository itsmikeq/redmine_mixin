# RedmineMixin

Enables some Redmine models to be available via other rails apps

## Installation

Add this line to your application's Gemfile:

    gem 'redmine_mixin'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redmine_mixin

## Usage

The "Enable REST web service" box must be checked on the Redmine server under Settings -> Authentication

The default username and password for the redmine server are used. To override, create a file in config called
redmine_mixin.yml and input your settings:

```yml
default: &default
  redmine_server: "http://localhost:3000"
  redmine_username: "admin"
  redmine_password: "admin"

development:
  <<: *default
  
test:
  <<: *default
  
production:
  <<: *default
```
The following Redmine models are exported via this gem:

* IssueResource
* UserResource
* MemberResource
* RoleResource
* ProjectResource
* GitResource
* MessageResource
* GroupResource
* CustomFieldResource
* CustomValueResource
* TrackerResource
* PrincipalResource
* UserResource

To use them in your Rails app, 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
