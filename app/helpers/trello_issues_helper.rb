module TrelloIssuesHelper
	include CustomFieldsHelper unless included_modules.include? CustomFieldsHelper
	include AttachmentsHelper unless included_modules.include? AttachmentsHelper

	# Renders issue children recursively
	def render_api_issue_children(issue, api)
    	return if issue.leaf?
    	api.array :children do
      		issue.children.each do |child|
        		api.issue(:id => child.id) do
          			api.tracker(:id => child.tracker_id, :name => child.tracker.name) unless child.tracker.nil?
          			api.subject child.subject
          			api.tracker(:id => child.tracker_id, :name => child.tracker.name) unless child.tracker.nil?
					api.status(:id => child.status_id, :name => child.status.name) unless child.status.nil?
					api.priority(:id => child.priority_id, :name => child.priority.name) unless child.priority.nil?
					api.author(:id => child.author_id, :name => child.author.name) unless child.author.nil?
				    api.assigned_to(:id => child.assigned_to_id, :name => child.assigned_to.name,  :mail => child.assigned_to.mail) unless child.assigned_to.nil?
					api.category(:id => child.category_id, :name => child.category.name) unless child.category.nil?
					api.fixed_version(:id => child.fixed_version_id, :name => child.fixed_version.name) unless child.fixed_version.nil?

  					api.description child.description
  					api.start_date child.start_date
  					api.due_date child.due_date
  					api.done_ratio child.done_ratio
  					api.estimated_hours child.estimated_hours
  					api.spent_hours(child.spent_hours)

  					render_api_custom_values child.custom_field_values, api

                    api.array :attachments do
                        child.attachments.each do |attachment|
                            render_api_attachment(attachment, api)
                        end
                    end
                    
          			render_api_issue_children(child, api)
        		end
      		end
    	end
  	end
end
