require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest

  def setup
   @user = users(:michael)
   @other = users(:alex)
   log_in_as(@user)
 end

  test "following page" do
    get following_user_path(@user)
    #assert_not @user.following.empty?
    assert_match @user.following.count.to_s, response.body
    @user.following.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  test "followers page" do
    get followers_user_path(@user)
    assert_not @user.followers.empty?
    assert_match @user.following.count.to_s, response.body
    @user.followers.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  test "should follow a user" do
    assert_difference '@user.following.count', 1 do
      post relationships_path, followed_id: @other.id
    end
  end

end
