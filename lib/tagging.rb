class Tagging < ActiveRecord::Base #:nodoc:
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true
  belongs_to :creator, 
    :class_name => "User",
    :foreign_key => :creator_id
  validates_inclusion_of :scope, :in=> TAG_SCOPES
  
  # scope defaults to most inner most scope
  def scope
    @scope ||= TAG_SCOPES.first
  end
  
  def after_destroy
    puts Tag.destroy_unused
    if Tag.destroy_unused
      if tag.taggings.count.zero?
        tag.destroy
      end
    end
  end
end
