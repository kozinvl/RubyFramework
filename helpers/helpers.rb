module EventuallyHelper
  module_function

  def eventually(timeout: 10, interval: 2, &block)
    time_limit = Time.now + timeout
    begin
      yield
    rescue StandardError => e
      raise e if Time.now >= time_limit

      sleep interval
      retry
    end
  end
end
