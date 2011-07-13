require File.expand_path('../../test_helper', __FILE__)
require 'tags_controller'

class TagsControllerTest < ActionController::TestCase
  fixtures  :projects, :users, :roles,
            :repositories, :issues, :issue_statuses, :changesets, :changes

  def setup
    @user = User.generate_with_protected!(:admin => true)
    @request.session[:user_id] = @user.id
    Setting.default_language = 'en'
  end

  def test_index

    get :index, :id => 3
    assert_response :success
    assert_template 'index.erb'
    assert_not_nil assigns(:tags)
  end

  def test_show
    get :show, :id => 3, :tag => 'tag01.annotated'
    assert_response :success
    assert_template 'show.erb'
    assert_not_nil assigns(:issues)
  end
end
