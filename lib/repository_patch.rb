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
    def find_issues_for_tags tag
      changesets_since_tag(tag).each(&:scan_comment_for_issue_ids)
    end
  end
end

# Add module to Repository
Repository.send(:include, RepositoryPatch)

