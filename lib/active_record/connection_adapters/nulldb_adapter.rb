require 'logger'
require 'stringio'
require 'singleton'
require 'pathname'

require 'active_support'
require 'active_record/connection_adapters/abstract_adapter'

require 'nulldb/core'
require 'nulldb/extensions'

require 'active_record/connection_adapters/quoting'

require 'active_record/connection_adapters/nulldb_adapter/core'
require 'active_record/connection_adapters/nulldb_adapter/statement'
require 'active_record/connection_adapters/nulldb_adapter/checkpoint'
require 'active_record/connection_adapters/nulldb_adapter/column'
require 'active_record/connection_adapters/nulldb_adapter/configuration'
require 'active_record/connection_adapters/nulldb_adapter/empty_result'
require 'active_record/connection_adapters/nulldb_adapter/index_definition'
require 'active_record/connection_adapters/nulldb_adapter/null_object'
require 'active_record/connection_adapters/nulldb_adapter/table_definition'

require 'active_record/tasks/nulldb_database_tasks' if defined?(ActiveRecord::Tasks)
register 'nulldb', 'ActiveRecord::ConnectionAdapters::NullDBAdapter', 'active_record/connection_adapters/nulldb_adapter'

module ActiveRecord
  module ConnectionHandling
    def nulldb_connection(config)
      ConnectionAdapters::NullDBAdapter.new(config)
    end
  end

  module ConnectionAdapters
    class NullDBAdapter < AbstractAdapter
      def initialize(config)
        super(nil, logger)
        @config = config
      end
    end
  end
end

