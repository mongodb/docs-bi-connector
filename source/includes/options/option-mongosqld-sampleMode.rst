.. option:: --sampleMode <[read|write]>

   *Default*: read

   .. versionadded:: 2.3
   
   Specifies whether :binary:`~bin.mongosqld` writes schema information
   to the MongoDB database named in the :option:`--sampleSource
   <mongosqld --sampleSource>` option or only reads previously sampled
   schema information from it.
   
   If you use the :option:`--sampleSource <mongosqld --sampleSource>`
   option to specify a database to store schema information, set
   :option:`--sampleMode <mongosqld --sampleMode>` to ``write`` to
   allow :binary:`~bin.mongosqld` to persist data in the specified
   database.
   
   .. include:: /includes/fact-samplemode-write-permission.rst
   
   .. include:: /includes/sampling-ref-chart-link.rst
   

