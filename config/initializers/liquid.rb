#--- Set up handling of liquid templates

Rails.application.config.to_prepare do

  #--- require each filter -- registration is done in the filter file itself
  Dir.glob(File.join(Rails.root, '/lib/liquid/filters/*.rb')).each do |path|
    require path
  end

  #--- require each tag -- registration is done in the tag file itself
  Dir.glob(File.join(Rails.root, '/lib/liquid/tags/*.rb')).each do |path|
    require path
  end
end
