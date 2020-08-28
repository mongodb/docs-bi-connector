.. option:: --sampleSource <db-name>

   .. versionadded:: 2.3
   
   Required when :option:`--sampleMode <mongosqld --sampleMode>` is set
   to write.   Specifies a database to store schema information.
   
   .. note::
   
      If you do not specify either a schema file with the
      :option:`--schema` option or a database with the
      ``--sampleSource`` option, :binary:`~bin.mongosqld` holds its
      schema in memory.
   
   .. include:: /includes/sampling-ref-chart-link.rst
   

