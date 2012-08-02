# Test whether a given class or definition is defined
Puppet::Parser::Functions::newfunction(:ensure_resource, :type => :statement, :doc => "

  Takes a resource type, title, and a list of attributes that describe a resource.

  Returns true if a resource with the specified attributes has already been added to the
  catalog, and false otherwise.

    user { 'dan':
      ensure => present,
    }

    # this only creates the resource if it does not already exist
    ensure_resource('user, 'dan', {'ensure' => 'present' })

") do |vals|
  type, title, params = vals
  raise(ArgumentError, 'Must specify a type') unless type
  raise(ArgumentError, 'Must specify a title') unless title
  params ||= {}
  if function_defined_with_params(["#{type}[#{title}]", params])
    Puppet.debug("Resource #{type}[#{title}] does not need to be created b/c it already exists")
  else
    function_create_resources(type.capitalize, title => params)
  end
end
