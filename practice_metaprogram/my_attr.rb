class Module
  def my_attr_accessor(*attributes)
    attributes.each { |attribute| class_eval("def #{attribute} ; @#{attribute} ; end" )}
    attributes.each { |attribute| class_eval("def #{attribute}=(val) ; @#{attribute}=val ; end" )}
  end

  def my_attr_reader(*attributes)
    attributes.each { |attribute| class_eval("def #{attribute} ; @#{attribute} ; end" )}
  end

  def my_attr_writer(*attributes)
    attributes.each { |attribute| class_eval("def #{attribute}=(val) ; @#{attribute}=val ; end" )}
  end
end
