require File.dirname(__FILE__) + '/abstract_unit'

class ScopedTaggablesTest < Test::Unit::TestCase
  fixtures :tags, :taggings, :posts, :users, :photos, :subscriptions, :magazines
  
  def test_taggings_have_scoped
    assert !photos(:sam_flower).tag_list.scope.nil?
  end
  
  def test_taggings_default_to_outermost
    assert_equal TAG_SCOPES.last, posts(:jonathan_sky).tag_list.scope
  end
end
