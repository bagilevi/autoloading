require "autoloading/version"

module Autoloading
  def const_missing(cname)
    prefix = underscore(self.name.to_s)
    filename = underscore(cname.to_s)
    path = "#{prefix}/#{filename}"
    begin
      require path
      return const_get(cname)
    rescue LoadError
      tried_requires = [path]
      (@autoload_without_namespacing || []).each do |dirname|
        path = "#{prefix}/#{dirname}/#{filename}"
        tried_requires << path
        begin
          require path
          return const_get(cname)
        rescue LoadError
        end
      end
      raise LoadError, "cannot load such file -- #{tried_requires.join(', ')}"
    end
  end

  # Based on ActiveSupport, removed inflections.
  # https://github.com/rails/rails/blob/v4.1.0.rc1/activesupport/lib/active_support/inflector/methods.rb
  def underscore(camel_cased_word)
    word = camel_cased_word.to_s.gsub('::', '/')
    word.gsub!(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
    word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
    word.tr!("-", "_")
    word.downcase!
    word
  end

  def autoload_without_namespacing(*dirnames)
    @autoload_without_namespacing ||= []
    @autoload_without_namespacing.concat(dirnames)
  end
end
