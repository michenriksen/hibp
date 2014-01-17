module Hibp
  class Api
    BASE_URI = 'https://haveibeenpwned.com/api'

    def self.breached_account?(email)
      JSON.parse(http_client.do_get("#{BASE_URI}/breachedaccount/#{CGI.escape(email)}").body)
    rescue Hibp::HttpClient::ClientError => ex
      return false if ex.status == 404
      raise ex
    end

  private

    def self.http_client
      @http_client ||= Hibp::HttpClient.new()
    end
  end
end
