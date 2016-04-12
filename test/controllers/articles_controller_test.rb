require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create article" do
    sign_in users(:one)
    assert_difference('Article.count') do
      post :create, article: { category_id: @article.category_id, content: @article.content, title: @article.title, user_id: @article.user_id }
    end
    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    sign_in users(:one)
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    sign_in users(:one)
    patch :update, id: @article, article: { category_id: @article.category_id, content: @article.content, title: @article.title, user_id: @article.user_id }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    sign_in users(:one)
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end
end
