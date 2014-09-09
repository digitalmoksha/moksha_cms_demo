# Application's CanCan ability class, include all gem abilities
#------------------------------------------------------------------------------
class Ability
  include CanCan::Ability
  include DmCore::Concerns::Ability
  include DmCms::Concerns::Ability
  include DmEvent::Concerns::Ability      if defined? DmEvent
  include DmForum::Concerns::Ability      if defined? DmForum
  include DmNewsletter::Concerns::Ability if defined? DmNewsletter
  
  def initialize(user)
    dm_cms_abilities(user)            if respond_to? :dm_cms_abilities
    dm_forum_abilities(user)          if respond_to? :dm_forum_abilities
    dm_event_abilities(user)          if respond_to? :dm_event_abilities
    dm_newsletter_abilities(user)     if respond_to? :dm_newsletter_abilities
    dm_core_abilities(user)           if respond_to? :dm_core_abilities
  end
end
