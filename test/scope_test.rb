require File.dirname(__FILE__) + '/abstract_unit'

class ScopedTaggablesTest < Test::Unit::TestCase
  fixtures :tags, :taggings, :posts, :users, :photos, :subscriptions, :magazines
  
  def test_taggings_have_scoped
    assert_equal TagList, (photos(:sam_flower).tag_list.add 'Jambala').class
    
    #require 'ruby-debug' ; debugger
    #raise tag_list.inspect
  end
end

