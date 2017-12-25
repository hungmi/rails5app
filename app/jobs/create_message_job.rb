class CreateMessageJob < ApplicationJob
  queue_as :urgent

  def perform(*args)
    Message.create(subject: "Message#{Message.all.size}", body: "created on #{Time.zone.now.strftime('%T')}")
  end
end
