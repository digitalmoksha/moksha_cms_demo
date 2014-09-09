class User < ActiveRecord::Base

  #--- DmCore already has default devise fields/tokens
  include DmCore::Concerns::User
  include DmForum::Concerns::User if defined? DmForum

end
