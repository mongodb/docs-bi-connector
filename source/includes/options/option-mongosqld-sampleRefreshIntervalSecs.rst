.. option:: --sampleRefreshIntervalSecs <number>

   *Default*: 0

   .. versionadded:: 2.3
   
   The interval in seconds at which :binary:`~bin.mongosqld` re-samples
   data to create its schema. The default value is ``0``, which means
   that after the initial sampling no re-sampling occurs for the
   duration of the connection. The specified value must be a positive
   integer.
   
   If you specify a non-zero value for ``--sampleRefreshIntervalSecs``
   and a schema database with the :option:`--sampleSource
   <mongosqld --sampleSource>` option,
   you must also set the :option:`--sampleMode <mongosqld --sampleMode>`
   option to ``write``. Otherwise, :binary:`~bin.mongosqld` halts with
   an error.
   
   .. include:: /includes/fact-resample-schema-data.rst
   

