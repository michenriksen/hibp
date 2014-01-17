module Hibp
  class HttpClient
    include HTTParty

    class HttpError < StandardError; end
    class ConnectionError < HttpError; end

    class RequestError < HttpError
      attr_reader :status, :body

      def initialize(method, path, status, body, options)
        @status = status
        @body   = body
        super("#{method} to #{path} returned status #{status} - options: #{options.inspect}")
      end
    end

    class ClientError < RequestError; end
    class ServerError < RequestError; end

    class UnhandledError < StandardError; end

    DEFAULT_TIMEOUT = 0.5 #seconds
    DEFAULT_RETRIES = 3

    Response = Struct.new(:status, :headers, :body)

    HANDLED_EXCEPTIONS = [
      ServerError,
      ClientError,
      Timeout::Error,
      Errno::ETIMEDOUT,
      Errno::ECONNRESET,
      Errno::ECONNREFUSED,
      Errno::ENETUNREACH,
      Errno::EHOSTUNREACH,
      EOFError
    ]

    def initialize(config = {})
      @config = {
        :timeout => DEFAULT_TIMEOUT,
        :retries => DEFAULT_RETRIES,
      }.merge(config)
      default_timeout = @config[:timeout]
    end

    def do_get(path, params=nil, opt={})
      do_request(:get, path, {:query => params}.merge(opt))
    end

    def do_post(path, params=nil, opt={})
      do_request(:post, path, {:body => params}.merge(opt))
    end

    def do_put(path, params=nil, opt={})
      do_request(:put, path, {:body => params}.merge(opt))
    end

    def do_delete(path, params=nil, opt={})
      do_request(:delete, path, {:query => params}.merge(opt))
    end

  private

    def do_request(method, path, options)
      with_retries do
        response = self.class.send(method, path, options)

        handle_possible_error(method.to_s.upcase, path, response, options)

        Response.new(response.code, response.headers, response.body)
      end
    end

    def handle_possible_error(method, path, response, options)
      if response.code >= 500
        raise ServerError.new(method, path, response.code, response.body, options)
      elsif response.code >= 400
        raise ClientError.new(method, path, response.code, response.body, options)
      end
    end

    def with_retries(&block)
      tries ||= @config[:retries]
      yield
    rescue *HANDLED_EXCEPTIONS, ServerError => ex
      if (tries -= 1) > 0
        sleep 0.2
        retry
      end
      raise ex
    rescue ClientError => ex
      raise ex
    rescue => ex
      raise UnhandledError.new(ex.message)
    end
  end
end
