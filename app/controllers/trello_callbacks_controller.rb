class TrelloCallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def webhook
    skip_authorization
    File.write("webhook_data/webhook_#{Time.now.to_i}.json",
               request.env['RAW_POST_DATA'])
    render nothing: true, status: 200
  end
end
