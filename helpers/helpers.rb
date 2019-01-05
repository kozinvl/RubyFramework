module Helpers
  def Helpers.eventually(options = {})
    timeout = options[:timeout] || 2
    interval = options[:interval] || 3
    time_limit = Time.now + timeout
    loop do
      begin
        yield
      rescue => error
      end
      return if error.nil? or FALSE
      raise error if Time.now >= time_limit
      sleep interval
    end
  end
end