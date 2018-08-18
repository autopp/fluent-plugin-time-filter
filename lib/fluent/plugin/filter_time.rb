#
# fluent-plugin-filter-time
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
#

require 'fluent/filter'

module Fluent
  # TimeFilter provides filter_time plugin for Fluentd
  #
  class TimeFilter < Filter
    Fluent::Plugin.register_filter('time', self)

    config_param :threshold, :integer, desc: <<~EODESC
      Threshold for filtering by timestamp.
      Events whose timestamp is older than `threshold` seconds ago are filtered out.
    EODESC

    def filter(_tag, time, record)
      delay = Fluent::Engine.now - time
      if delay <= threshold
        record
      else
        log.debug('skipped record older than threshold',
                  time: Time.at(time), delay: delay, plugin_id: plugin_id)
        nil
      end
    end
  end
end
