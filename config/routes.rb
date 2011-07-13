ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => :tags, :conditions => { :method => :get } do |tag|
    tag.tags 'projects/:id/repository/tags', :action => :index
    tag.tag 'projects/:id/repository/tags/:tag/to/:before_tag', :action => :show
    tag.tag 'projects/:id/repository/tags/:tag/to/', :action => :show
  end
end
