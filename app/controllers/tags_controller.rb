class TagsController < ApplicationController
  before_filter :find_repository

  def index
    @tags = []
    raw_tags = @repository.tags
    raw_tags.each_with_index do |tag,i|
      @tags << [ tag, raw_tags[i+1] ]
    end
  end

  def show
    @issues = @repository.find_issues_for_tag params[:tag], params[:before_tag]
  end

  private
  def find_repository
    @project = Project.find(params[:id])
    @repository = @project.repository
    (render_404; return false) unless @repository
    @path = params[:path].join('/') unless params[:path].nil?
    @path ||= ''
    @rev = params[:rev].blank? ? @repository.default_branch : params[:rev].strip
    @rev_to = params[:rev_to]

    if @repository.branches.blank?
      raise InvalidRevisionParam
    end
  rescue ActiveRecord::RecordNotFound
    render_404
  rescue InvalidRevisionParam
    show_error_not_found
  end
end
