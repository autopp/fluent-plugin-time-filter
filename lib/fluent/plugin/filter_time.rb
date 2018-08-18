require 'fluent/plugin/filter'

module Fluent
  # TimeFilter provides filter_time plugin for Fluentd
  #
  class Plugin::TimeFilter < Plugin::Filter
    Fluent::Plugin.register_filter('time', self)

    config_param :threshold, :integer, desc: <<~EODESC
      Threshold for filtering by timestamp.
      Events whose timestamp is older than `threshold` seconds ago are filtered out.
    EODESC

    def filter(_tag, time, record)
      record if time >= Fluent::Engine.now - threshold
    end
  end
end
