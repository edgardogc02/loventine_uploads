class ApplicationJob < ActiveJob::Base

  include ActiveJob::Retriable

  rescue_from Exception do |e|
    if retry_attempt > 5 # MAX RETRIES. max_retry method from activejob-retriable gem doesn't work.
      raise e
    else
      Rails.logger.error(e)
      retry_job wait: 2.minutes, queue: :error_retry
    end
  end

end