require_dependency 'repository/git'

# patches chiliproject's git_adapter dynamicaly,
# add changesets_since_tag
module GitPatch
  def self.included(base) # :nodoc:
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end

  module ClassMethods

  end

  module InstanceMethods

    def changesets_since_tag tag
      revs = scm.revisions(nil,tag,nil)
      return [] if revs.nil? || revs.empty?

      changesets.find(
        :all,
        :conditions => [
          "scmid IN (?)",
          revs.map!{|c| c.scmid}
        ],
        :order => 'committed_on DESC'
      )
    end

  end
end

# Add module to Git
Repository::Git.send(:include, GitPatch)
