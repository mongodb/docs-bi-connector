.. list-table::
   :widths: 30 10 40 10 10
   :stub-columns: 1
   :header-rows: 1

   * - Environment Variable
     - Data Type
     - Description
     - Default Value (Atlas-hosted)
     - Default Value (On Premises)
   * - ``log_level``
     - integer
     - Specifies the logging level for |bi-short|:

       * ``-1``: Do not log
       * ``0``: Log only messages for database users, such as basic
         ``mongosqld`` events and state changes.
       * ``1``: Log only messages for ``mongosqld`` administrators.
       * ``2``: For internal use only.
     - ``0``
     - ``2``
   * - ``max_nested_table_depth``
     - integer
     - Specifies the maximum number of unique nested field paths that
       ``mongosqld`` maps to a relational table for a collection.
     - ``50``
     - ``50``
   * - ``max_num_columns_per_table``
     - integer
     - The maximum number of unique fields that ``mongosqld`` maps to
       relational columns for a collection.
     - ``1000``
     - ``2000``
   * - ``mongodb_max_varchar_length``
     - integer
     - Specifies the maximum string length returned for columns using
       the ``VARCHAR`` data type. A value of ``0`` specifies
       no limit.
     - ``0``
     - ``0``
   * - ``full_pushdown_exec_mode``
     - boolean
     - Specifies whether a query error is returned for queries with
       clauses that aren't fully pushed down. SQL query predicates
       usually appear in ``WHERE`` clauses and are used to filter data
       returned by the query.
     - ``0``
     - ``0``
   * - ``sample_refresh_interval_secs``
     - integer
     - Specifies how frequently, in seconds, that the |bi-short| schema
       is updated. A value of ``0`` specifies that the schema is not 
       refreshed after |bi-short| starts.

       See :doc:`Cached Sampling </schema/cached-sampling>` for more
       information.
     - ``0``
     - ``300``
   * - ``sample_size``
     - integer
     - Specifies how many documents |bi-short| samples when generating
       its schema. A value of ``0`` specifies that |bi-short| performs
       a collection scan across all collections.

       See :doc:`Cached Sampling </schema/cached-sampling>` for more
       information.
     - ``1000``
     - ``100``
   * - ``schema_mapping_heuristic``
     - string
     - Specifies how the MongoDB schema is transformed into a relational
       schema:

       * ``lattice``: See :doc:`Sampling Type Conflicts </schema/type-conflicts>`
         for more information. 
       * ``majority``: |bi-short| assigns the most common data type for
         a field occuring in a sample.

     - ``lattice``
     - ``lattice``

