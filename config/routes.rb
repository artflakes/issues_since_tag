ActionController::Routing::Routes.draw do |map|
  map.with_options :controller => :tags, :conditions => { :method => :get } do |tag|
    tag.tags 'projects/:id/repository/tags', :action => :index
    tag.tag 'projects/:id/repository/tags/:tag', :action => :show
  end
end
