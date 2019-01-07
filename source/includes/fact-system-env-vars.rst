.. list-table::
   :widths: 30 10 50 10
   :stub-columns: 1
   :header-rows: 1

   * - Environment Variable
     - Data Type
     - Description
     - Default Value
   * - ``enable_table_alterations``
     - boolean
     - Enables the server to process the ``ALTER_TABLE`` SQL statement.
     - false
   * - ``log_level``
     - integer
     - Specifies the logging level for |bi-short|:

       * ``-1``: Do not log
       * ``0``: Log only messages for database users, such as basic
         ``mongosqld`` events and state changes.
       * ``1``: Log only messages for ``mongosqld`` administrators.
       
     - ``0``
   * - ``metrics_backend``
     - string
     - Specifies where |bi-short| stores query metrics:
       
       * ``off``: Do not store query metrics
       * ``log``: Store query metrics in the |bi-short| log file
       * ``stitch``: Store query metrics in MongoDB Stitch
     - ``off``
   * - ``mongodb_max_varchar_length``
     - integer
     - Specifies the maximum string length returned for columns using
       the ``VARCHAR`` data type. A value of ``0`` specifies
       no limit.
     - ``0``
   * - ``full_pushdown_exec_mode``
     - boolean
     - Specifies whether a query error is returned for queries with
       predicates that aren't fully pushed down. SQL query predicates
       usually appear in ``WHERE`` clauses and are used to filter data
       returned by the query.
     - ``false``
   * - ``sample_refresh_interval_secs``
     - integer
     - Specifies how frequently, in seconds, that the |bi-short| schema
       is updated. A value of ``0`` specifies that the schema is not 
       refreshed after |bi-short| starts.

       See :doc:`Cached Sampling </schema/cached-sampling>` for more
       information.
     - ``0``
   * - ``sample_size``
     - integer
     - Specifies how many documents |bi-short| samples when generating
       its schema. A value of ``0`` specifies that |bi-short| performs
       a collection scan across all namespaces.

       See :doc:`Cached Sampling </schema/cached-sampling>` for more
       information.
     - 1000
   * - ``schema_mapping_heuristic``
     - string
     - Specifies how the MongoDB schema is transformed into a relational
       schema:

       * ``lattice``: See :doc:`Sampling Type Conflicts </schema/type-conflicts>`
         for more information. 
       * ``majority``: |bi-short| assigns the most common data type for
         a field occuring in a sample.

     - ``lattice``

