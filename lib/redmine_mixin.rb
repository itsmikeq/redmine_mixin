require 'redmine_mixin/version'
require 'yaml'
require 'rubygems'
require 'active_resource'
require 'active_support/core_ext/hash/indifferent_access'
require 'logger'
require 'net/http'
require 'open-uri'

# Needed to override the default Hash method
# (without it, collections are not returned)
class Hash
  def collect!(&block)
    ret = []
    self.each {|key,val|
      if val.kind_of? Array
        val.collect!{|subval|
          block.call subval
        }
      ret = val
      end
    }
    return ret
  end
end

class XMLFormatter
  include ActiveResource::Formats::XmlFormat
  def initialize(what)
    @what
  end

  def decode(xml)
    ActiveResource::Formats::XmlFormat.decode(xml)[@what]
  end
end

# class Project < ActiveResource::Base
# self.format = XMLFormatter.new("project")
# end

module RedmineMixin
  RAILS_ENV = ENV['RAILS_ENV'] ? ENV['RAILS_ENV'] : "development"
  begin
    APP_CONFIG = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path("#{Rails.root}config/redmine_mixin.yml", __FILE__))))[RAILS_ENV]
  rescue => e
    puts e
    APP_CONFIG = HashWithIndifferentAccess.new(YAML.load(File.read(File.expand_path('../../config/redmine_mixin.yml', __FILE__))))[RAILS_ENV]
  end
  def initialize(options={})

  end

  # All formats must be json.  Breaks otherwise
  class IssueResource < ActiveResource::Base
    self.element_name = "issue"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class UserResource < ActiveResource::Base
    self.element_name = "user"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class MemberResource < ActiveResource::Base
    self.element_name = "member"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class RoleResource < ActiveResource::Base
    self.element_name = "role"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class ProjectResource < ActiveResource::Base
    self.element_name = "project"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
  self.format = :json
  end

  class GitResource < ActiveResource::Base
    self.element_name = "git"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class MessageResource < ActiveResource::Base
    self.element_name = "message"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class GroupResource < ActiveResource::Base
    self.element_name = "group"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class CustomFieldResource < ActiveResource::Base
    self.element_name = "custom_field"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class CustomValueResource < ActiveResource::Base
    self.element_name = "custom_value"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class TrackerResource < ActiveResource::Base
    self.element_name = "tracker"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class PrincipalResource < ActiveResource::Base
    self.element_name = "principal"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

  class UserResource < ActiveResource::Base
    self.element_name = "user"
    self.user=APP_CONFIG[:redmine_username]
    self.password=APP_CONFIG[:redmine_password]
    self.site = APP_CONFIG[:redmine_server]
    self.format = :json
  end

end
