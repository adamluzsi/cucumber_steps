module CucumberSteps::WorldExtensions::RestMethods

  attr_reader :last_response

  def rest_call(http_method, url, params, headers)
    @last_response = rest_client.public_send(http_method.to_s.downcase) do |request|
      request.url(url)
      request.params.replace params
      request.headers.replace headers
    end
  end

  def rest_client
    CucumberSteps::REST.new(*rest_middlewares)
  end

  def use_faraday_middleware(middleware_class, *args, &block)
    rest_middlewares << {class: middleware_class, args: args, block: block}
  end

  def rest_middlewares
    @rest_middlewares ||= []
  end

end