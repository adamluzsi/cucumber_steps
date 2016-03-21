require 'faraday'
require 'forwardable'
class CucumberSteps::RestClient

  extend Forwardable

  def_delegators :@connection, :get, :post, :put, :delete

  protected

  def initialize(*middlewares)
    @connection = Faraday.new do |b|
      middlewares.each { |prop| b.use(prop[:class],*prop[:args],&prop[:block]) }
      b.adapter Faraday.default_adapter
    end
  end

end