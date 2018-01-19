module Bot
  class Base
    def initialize(data)
      @data = data
    end

    def execute
      raise NotImplementedError
    end

    private

    def chat_id
      @data.fetch('message').fetch('chat').fetch('id')
    end
  end
end