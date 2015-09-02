Redmine::Plugin.register :redmine_trello do
  name 'Redmine Trello plugin'
  author 'BadrIT'
  description 'Creating a trello like interface for redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://www.badrit.com'

  permission :trello_projects, { :trello_projects => [:index] }, :public => true
  menu :project_menu, :trello_projects, { :controller => 'trello_projects', :action => 'index' }, :caption => 'Trello', :after => :activity, :param => :project_id,
   :html => { :target => '_blank' }

  settings :default => {'empty' => true}, :partial => 'settings/remine_trello'
end