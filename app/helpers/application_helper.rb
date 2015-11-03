module ApplicationHelper
  def current_inbox
    Inbox.find params[:inbox_id] if params[:inbox_id]
  end
end
