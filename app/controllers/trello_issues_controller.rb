class TrelloIssuesController < ApplicationController
	unloadable
    
  include TrelloIssuesHelper

	def show
  		issue_id = params[:issue_id]
    	@issue = Issue.find(issue_id)
  		respond_to do |format|
        format.html
        format.api
    	end
  	end
end
