|bi| version 2.3 improves enterprise deployment support. The new
features include:

Improved Schema Management
~~~~~~~~~~~~~~~~~~~~~~~~~~

|bi-short| has been simplified to a single component.
The schema sampling and mapping features of
:doc:`mongodrdl </reference/mongodrdl>` have added to
:doc:`mongosqld </reference/mongosqld>`.
The :doc:`mongosqld </reference/mongosqld>` maps schemas itself.

Kerberos Authentication Support
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

|bi-short| can now use `Kerberos <https://web.mit.edu/kerberos/>`_,
an enterprise security protocol that authenticates clients through
a trusted third server.

Log Rotation
~~~~~~~~~~~~

With version 2.3, :doc:`mongosqld </reference/mongosqld>` can rotate its
logs upon command. When the log rotate command is issued, the existing
log file is closed and a new empty log file is opened.
