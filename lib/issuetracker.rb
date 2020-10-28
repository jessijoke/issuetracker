require 'issuetracker/version'
require 'issuetracker/cli'
require 'issuetracker/issues'
require 'issuetracker/fileio'
module Issuetracker
  class Error < StandardError; end

  cli = CLI.new
  if (cli.options[:delete] && cli.options[:new] && cli.options[:show] && cli.options[:update]) ||
     (cli.options[:delete] && cli.options[:new] && cli.options[:update]) ||
     (cli.options[:delete] && cli.options[:show] && cli.options[:new]) ||
     (cli.options[:new] && cli.options[:show] && cli.options[:update])||
     (cli.options[:new] && cli.options[:show]) ||
     (cli.options[:new] && cli.options[:update]) ||
     (cli.options[:new] && cli.options[:delete]) ||
     (cli.options[:delete] && cli.options[:update]) ||
     (cli.options[:delete] && cli.options[:show]) ||
     (cli.options[:update] && cli.options[:show])
    raise Error, "Incompatible option combination\n\nTry using the -h option flag for help"
  elsif cli.options[:version]
    puts VERSION
  end
end
