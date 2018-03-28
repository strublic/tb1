require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'valid post' do
    post = Post.new(msg: 'Thread One')
    assert post.valid?
  end

  test 'invalid post without msg' do
    post = Post.new()
    refute post.valid?, 'post is invalid without a msg'
    assert_not_nil post.errors[:msg], 'no validation error for msg present'
  end

  test 'valid post without parent' do
    post = Post.new(msg: 'Thread Two w parent')
    assert post.valid?
    assert_not_nil post.errors[:parent_id]
  end
end