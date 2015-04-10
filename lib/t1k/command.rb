require 't1k/commands/init'
require 't1k/commands/hack'
require 't1k/commands/commit'
require 't1k/commands/sink'

module T1k
  INIT = "init"
  HACK = "hack"
  COMMIT = "commit"
  SINK = "sink"

  class Command

    def initialize(argv)
      @args = argv
    end

    def run
      T1k.setup_credentials

      @args.count == 0 ? help : parse_args(@args)
    end

    def help
      puts "T1K (T-100) Gem. It's a help and let's learn"
      puts ""
      puts "t1k [command] <params>"
      puts ""
      puts T1k::Commands::Init.help
      puts T1k::Commands::Hack.help
      puts T1k::Commands::Commit.help
      puts T1k::Commands::Sink.help
    end

    private

    def parse_args(args)
      command = args[0]

      T1k::Commands::Init.run if command == INIT && args.count == 1
      T1k::Commands::Hack.run(args[1]) if command == HACK && args.count == 2
      T1k::Commands::Commit.run(args[1..args.count]) if command == COMMIT
      T1k::Commands::Sink.run if command == SINK && args.count == 1
    end
  end
end