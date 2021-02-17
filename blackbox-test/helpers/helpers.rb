module EventuallyHelper
  module_function

  def eventually(timeout: 10, interval: 2, &block)
    time_limit = Time.now + timeout
    begin
      yield
    rescue Exception => e
      raise e if Time.now >= time_limit

      # waiting when object will appear
      sleep interval
      retry
    end
  end
end
