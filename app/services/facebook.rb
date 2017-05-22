class Facebook
  attr_accessor :fbgraph, :id, :query, :args, :connection_name, :options

  def initialize(fbgraph, params)
    @fbgraph = fbgraph
    @id = params[:id]

    @query   = params.fetch(:query, {})
    @args    = params.fetch(:args, {})
    @options = params.fetch(:options, {})
    @connection_name = params.fetch(:connection_name, '')
  end

  def self.fbgraph(token)
    Koala::Facebook::API.new(token)
  end

  def self.call(method, fbgraph, params = {}, &block)
    new(fbgraph, params).send(method, &block)
  end

  def get_object
    @fbgraph.get_object(@id, @args, @options)
  end

end
