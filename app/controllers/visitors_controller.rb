class VisitorsController < ApplicationController
  def index
    redirect_to Inbox.first if Inbox.count == 1
  end
end
