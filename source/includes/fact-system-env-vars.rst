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
       * ``1``: Log only messages for database administrator.
       
     - ``0``
   * - ``metrics_backend``
     - string
     - Specifies where |bi-short| stores query metrics:
       
       * ``off``: Do not store query metrics
       * ``log``: Store query metrics in the |bi-short| log file
       * ``stitch``: Store query metrics in MongoDB Stitch
     - ``off``
   * - ``mongodb_max_server_size``
     - integer
     - Specifies the maximum memory in bytes allocated to evaluate
       queries on |bi-short|. A value of ``0`` specifies no limit.
     - ``0``
   * - ``mongodb_max_connection_size``
     - integer
     - Specifies the maximum memory in bytes allocated to evaluate
       queries on a client of |bi-short|. A value of ``0`` specifies
       no limit.
     - ``0``
   * - ``mongodb_max_stage_size``
     - integer
     - Specifies the maximum memory in bytes allocated to evaluate
       queries in any query evaluation stage. A value of ``0`` specifies
       no limit.
     - ``0``
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

   * - ``optimize_cross_joins``
     - boolean
     - Specifies whether cross joins are optimized as inner joins when
       possible.
     - ``true``
   * - ``optimize_evaluations``
     - boolean
     - Specifies whether `constant folding <https://en.wikipedia.org/wiki/Constant_folding>`_
       is enabled.
     - ``true``
   * - ``optimize_filtering``
     - boolean
     - Specifies whether MongoDB moves predicates in ``WHERE`` clauses
       closer to the data on which they operate.
     - ``true``
   * - ``optimize_inner_joins``
     - boolean
     - Specifies whether inner joins are reordered for more optimal
       query execution.
     - ``true``
   * - ``optimize_self_joins``
     - boolean
     - Specifies whether a non-json ``schema_mapping_heuristic`` causes
       parent and progeny queries with ``JOIN`` clauses are more
       optimally evaluated.
     - ``true``
   * - ``optimize_view_sampling``
     - boolean
     - Specifies whether the :manual:`$sample aggregation operator </reference/operator/aggregation/sample>`
       is moved ahead of non-cardinal pipeline stages in :manual:`views </core/views>`.
     - ``true``
   * - ``polymorphic_type_conversion_mode``
     - string
     - Determines how MongoDB evaluates document fields that contain
       multiple data types. For example, ``count`` could be a number
       in one document and a string in another:

       * ``off``: queries may fail if not explicitly cast
       * ``fast``: |bi-short| appropriately casts such fields if MongoDB
         MongoDB sampled two documents with different data types for the
         same field. In our example, MongoDB would cast ``count`` as an
         integer.
       * ``safe``:  |bi-short| unconditionally casts such fields
     - ``off``
   * - ``pushdown``
     - boolean
     - Specifies whether queries are translated to 
       :manual:`MongoDB's native aggregation operators <//reference/sql-aggregation-comparison>`.
     - ``true``
   * - ``sample_refresh_interval_secs``
     - integer
     - Specifies how frequently, in seconds, that the |bi-short| schema
       is updated. A value of ``0`` specifies that the schema is not 
       refreshed after |bi-short| starts.
     - ``0``
   * - ``sample_size``
     - integer
     - Specifies how many documents |bi-short| samples when generating
       its schema. A value of ``0`` specifies that |bi-short| performs
       a collection scan across all namespaces.
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
   * - ``type_conversion_mode``
     - string
     - Specifies the semantics that |bi-short| uses for type conversions,
       such as the ``CAST`` function:

       * ``mysql``
       * ``mongosql``
       
     - ``mongosql``

