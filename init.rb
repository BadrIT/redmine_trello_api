Redmine::Plugin.register :redmine_trello do
  name 'Redmine Trello plugin'
  author 'BadrIT'
  description 'API plugin for Trello-For-Redmine plugin'
  version '0.0.1'
  url 'https://github.com/BadrIT/redmine_trello_api'
  author_url 'http://www.badrit.com'

  permission :trello_projects, { :trello_projects => [:index] }, :public => true
  menu :project_menu, :trello_projects, { :controller => 'trello_projects', :action => 'index' }, :caption => 'Trello', :after => :activity, :param => :project_id,
   :html => { :target => '_blank' }

  settings :default => {'empty' => true}, :partial => 'settings/remine_trello'
end
