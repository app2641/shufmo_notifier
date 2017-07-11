#! /usr/bin/env ruby

$:.unshift(File.expand_path('../../lib', __FILE__)) if __FILE__ == $0
require 'rubygems'
require 'shufmo_notifier'

parser = ShufmoNotifier::Parser.new(ENV['SHUFMO_URL'])
doc = parser.parse

searcher = ShufmoNotifier::Searcher.new(doc)
items = searcher.search
return if items.empty?

message = ShufmoNotifier::Formatter.format(items)
ShufmoNotifier::Slack.post(ENV['SLACK_API_URL'], text: message)
