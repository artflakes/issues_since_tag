require 'redmine'

# Patches to the Redmine core.
require_dependency 'repository_patch'
require_dependency 'git_patch'

Redmine::Plugin.register :issues_since_tag do
  name 'Redmine Issues Since Tag plugin'
  author 'Daniel Schweighöfer'
  description 'A plugin to display all issues since a chosen tag'
  version '0.0.1'
  url 'http://github.com/'
  author_url 'http://netsteward.net'

  permission :issues_since_tag, {:issues_since_tag => [:index, :vote]}, :public => true
  menu :application_menu, :issues_since_tag, { :controller => 'tags', :action => 'index' }, :caption => 'issues_since_tag', :after => :repository

  project_module :issues_since_tag do
    permission :view_issues_since_tag, :tags => [:index, :show]
  end
end
