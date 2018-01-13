class BotCommandFactory
  COMMANDS_MAPPING = {
    Bot::Start::KEY => Bot::Start,
    Bot::Stop::KEY => Bot::Stop
  }.freeze

  def self.get_command(command_key)
    COMMANDS_MAPPING.fetch(command_key)
  rescue KeyError
    Bot::Unknown
  end
end
