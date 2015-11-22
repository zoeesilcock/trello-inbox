module Webhooks
  def webhook_fixture(action)
    File.read("spec/fixtures/webhook_#{action}.json")
  end
end
