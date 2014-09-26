module ApplicationHelper
  def element_value(args)
    @xml_entry = args[:xml_entry]
    @xml_element = args[:xml_element]
    if @xml_entry.at_xpath(@xml_element).nil?
      return ""
    else 
      return @xml_entry.at_xpath(@xml_element).text
    end
  end # def element_value(args)

  def attribute_value(args)
    @xml_entry = args[:xml_entry]
    @xml_element = args[:xml_element]
    @attribute = args[:attribute]
    if @xml_entry.at_xpath(@xml_element).attribute(@attribute).nil?
      return ""
    else 
      return @xml_entry.at_xpath(@xml_element).attribute(@attribute).text
    end
  end # def attribute_value(args)
end # module ApplicationHelper
