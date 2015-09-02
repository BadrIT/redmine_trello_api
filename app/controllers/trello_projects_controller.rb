class TrelloProjectsController < ApplicationController
  unloadable

  def index
  	# get user api key
  	user_api_key = User.current.api_key

  	# load project 
  	project = User.current.projects.find(params[:project_id])

  	unless Setting.plugin_redmine_trello['trello_url'].present?
  		flash[:error] = l(:trello_url_host_undefined)
  		redirect_to project_path(project)
  	else
  		# auth user
  		redirect_to "#{Setting.plugin_redmine_trello['trello_url']}/redmine/authenticate/#{project.id}/#{user_api_key}"
  	end
  end
end
