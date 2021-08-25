require 'uri'

module BotFramework
  class ApiBase
    include HTTParty
    attr_accessor :service_url

    def initialize(service_url)
      @service_url = service_url.chomp("/")
    end

    def api_get(local_uri, _opts = {})
      uri = full_url(local_uri)

      BotFramework.logger.info uri
      JSON.parse(BotFramework.connector.token.get(uri).body)
    end

    def api_post(local_uri, opts = {})
      uri = full_url(local_uri)

      BotFramework.logger.info uri
      JSON.parse(BotFramework.connector.token.post(uri, body: opts.to_json,
                                                        headers: { 'Content-Type' => 'application/json' }).body)
    end

    def api_put(local_uri, opts = {})
      uri = full_url(local_uri)

      BotFramework.logger.info uri
      JSON.parse(BotFramework.connector.token.put(uri, body: opts.to_json,
                                                        headers: { 'Content-Type' => 'application/json' }).body)
    end

    def api_delete(local_uri)
      uri = full_url(local_uri)
      BotFramework.connector.token.delete(uri)
    end

    def api_request(method, local_uri, opts)
      uri = full_url(local_uri)
      JSON.parse(BotFramework.connector.token.request(method, uri, opts))
    end

    private
    def full_url(local_uri)
      URI::parse("#{@service_url}#{Addressable::URI.escape(local_uri)}")
    end

  end
end
