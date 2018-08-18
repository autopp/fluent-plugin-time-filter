require 'fluent/plugin/filter'

module Fluent
  # TimeFilter provides filter_time plugin for Fluentd
  #
  class Plugin::TimeFilter < Plugin::Filter
    Fluent::Plugin.register_filter('time', self)
  end
end
