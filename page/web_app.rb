class WebApp
  # Page Object Accessors
  # Converts a method call to a page object class and establishes a new instance

  def method_missing(name)
    klass = name.to_s.split('_')
                .collect(&:capitalize)
                .join
    create_page_object(klass)
  end

  def page
    @page ||= BasePage.new
  end

  private

  def constant_exists?(klass_string)
    Object.const_defined? klass_string
  end

  def create_page_object(klass_string)
    if constant_exists?(klass_string)
      Object.const_get(klass_string).new
    else
      raise "There's no page object currently defined called #{klass_string}"
    end
  end
end