License
-------
Apache

Author
------

Dan Bode

About
-----

This module contains a single function that can be used to conditional create resources
provided that there is not already a resource with the same specified characteristics.

It accepts a resource type, title, and a list of attributes that describe a resource.

It adds the resource to the catalog provided that the same resource has not already been added
with the same parameters.

if there are no existing resources, it tries to create the resources.

If a resource had already existed with conflicting parameters, this would results in a
duplicate resource failure error.

Example
-------

    user { 'dan':
      ensure => present,
    }

    # this only creates the resource if it does not already exist
    ensure_resource('user, 'dan', {'ensure' => 'present' })
