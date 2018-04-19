If your MongoDB instance uses :manual:`authentication
</core/authentication/>`, your |bi-short| instance must also use
authentication. The user that connects to MongoDB
via the :binary:`~bin.mongosqld` program must have permission to list
all of the databases in your MongoDB deployment, as well as
permission to read from all the namespaces to wish to read data from.

For more details about MongoDB user permissions in |bi-short|, see
:ref:`User Permissions for Cached Sampling
<cached-sampling-user-permissions>`.