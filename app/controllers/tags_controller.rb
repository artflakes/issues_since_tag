class TagsController < ApplicationController
  before_filter :find_repository

  def index
    @tags = @repository.tags
  end

  def show
    @issues = @repository.find_issues_for_tags params[:tag]
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
