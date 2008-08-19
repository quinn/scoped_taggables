require File.dirname(__FILE__) + '/abstract_unit'

class ScopedTaggablesTest < Test::Unit::TestCase
  fixtures :tags, :taggings, :posts, :users, :photos, :subscriptions, :magazines
  
  def test_taggings_have_scoped
    assert !photos(:sam_flower).tag_list.scope.nil?
  end
  
  def test_taggings_default_to_outermost
    assert_equal TAG_SCOPES.last, posts(:jonathan_sky).tag_list.scope
  end
  
  def test_taggings_distinguish_on_scope
    assert_equivalent ['family'], posts(:jonathan_sky).tag_list(:scope=> 'endoplasm')
    assert_equal 'endoplasm', posts(:jonathan_sky).tag_list(:scope=> 'endoplasm').scope
    
    # we're going to do this without a reload of jonny.
    assert_equivalent ["Nature", "Very good"], posts(:jonathan_sky).tag_list
    assert_equal 'exoplasm', posts(:jonathan_sky).tag_list.scope
  end
  
end
