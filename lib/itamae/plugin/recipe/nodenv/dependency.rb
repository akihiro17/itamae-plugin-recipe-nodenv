# Dependencies to install x.y.z (see also: development_dependency.rb)
# https://github.com/nodenv/node-build/wiki#suggested-build-environment
case node[:platform]
when 'debian', 'ubuntu', 'mint'
  package 'g++'
  package 'make'
when 'redhat', 'fedora', 'amazon', 'opensuse' # redhat includes CentOS
  package 'gcc-c++'
  package 'make'
else
  raise NotImplementedError, "Platform '#{node[:platform]}' is not supported by nodenv::dependency yet"
end

package 'git'
