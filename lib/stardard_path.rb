module StandardPath

  VERSION = "0.1.0"

  OSes = ['Windows', 'macOS', 'Linux']

end


class << StandardPath

  class UnknownOS < StandardError ; end
  class NotSupportedOS < StandardError; end

  def os
    host_os = RbConfig::CONFIG['host_os']
    if Gem.win_platform?
      'Windows'
    elsif host_os =~ /darwin/
      'macOS'
    elsif host_os =~ /mac/
      # This condition is just for possible future compatibility only
      'macOS'
    elsif host_os =~ /linux/
      'Linux'
    elsif host_os =~ /freebsd/
      'FreeBSD'
      raise NotSupportedOS, "Currently #{name} doesn't support FreeBSD."
    else
      'Unknown'
      raise UnknownOS, "#{name} doesn't know about your OS type."
    end
  end


  def desktop(os = self.os)
    case os
    when 'Windows', 'macOS', 'Linux'
      File.expand_path "~/Desktop"
    else
      raise NotSupportedOS, "#{name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
  end


  def documents(os = self.os)
    case os
    when 'Windows', 'macOS', 'Linux'
      File.expand_path "~/Documents"
    else
      raise NotSupportedOS, "#{name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
  end


  def downloads(os = self.os)
    case os
    when 'Windows', 'macOS', 'Linux'
      File.expand_path "~/Downloads"
    else
      raise NotSupportedOS, "#{name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
  end


  def pictures(os = self.os)
    case os
    when 'Windows', 'macOS', 'Linux'
      File.join Dir.home, 'Pictures'
    else
      raise NotSupportedOS, "#{name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
  end


  def music(os = self.os)
    case os
    when 'Windows', 'macOS', 'Linux'
      File.expand_path '~/Music'
    else
      raise NotSupportedOS, "#{name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
  end


  def movies(os = self.os)
    case os
    when 'Windows', 'Linux'
      File.expand_path '~/Videos'
    when 'macOS'
      File.expand_path '~/Movies'
    else
      raise NotSupportedOS, "#{name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
  end


  alias videos movies


  def app_data(app, os = self.os)
    base = case os
    when 'Windows'
      File.join "~/AppData/Roaming", app
    when 'macOS'
      File.join "~/Library/Application Support", app
    when 'Linux'
      File.join "~/.local/share", app
    else
      raise NotSupportedOS, "#{self.name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
    File.expand_path base
  end


  def app_local_data(app, os = self.os)
    base = case os
    when 'Windows'
      File.join "~/AppData/Local", app
    when 'macOS'
      File.join "~/Library/Application Support", app
    when 'Linux'
      File.join "~/.local/share", app
    else
      raise NotSupportedOS, "#{self.name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
    File.expand_path base
  end


  def app_config(app, os = self.os)
    base = case os
    when 'Windows'
      File.join "~/AppData/Local", app
    when 'macOS'
      File.join "~/Library/Preferences", app
    when 'Linux'
      File.join '~/.config', app
    else
      raise NotSupportedOS, "#{self.name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
    File.expand_path base
  end


  def app_cache(app, os = self.os)
    base = case os
    when 'Windows'
      File.join "~/AppData/Local", app, 'cache'
    when 'macOS'
      File.join "~/Library/Caches", app
    when 'Linux'
      File.join '~/.cache', app
    else
      raise NotSupportedOS, "#{self.name} doesn't know about #{__method__} path of '#{os}' you specify"
    end
    File.expand_path base
  end

end
