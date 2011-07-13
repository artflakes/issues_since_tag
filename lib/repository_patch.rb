require_dependency 'repository'

# patches chiliproject's repository dynamicaly,gt
# add find_issues_for_tags
module RepositoryPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods

  end

  module InstanceMethods
    def find_issues_for_tag tag, before_tag
      issues = []
      changesets_between_tags(tag, before_tag).each do |changeset|
        issues += changeset.issues
      end
      issues
    end
  end
end

# Add module to Repository
Repository.send(:include, RepositoryPatch)

