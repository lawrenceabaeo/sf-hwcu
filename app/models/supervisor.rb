class Supervisor < ActiveRecord::Base
  # Note: For this simple app we are not considering
  # historical supervisors (we are only considering the current 
  # supervisor as of 09-26-2014), or the possibility that two different 
  # districts may have supes may with the same name (ex. John Smith)
  
  validates :district, uniqueness: true
  
  def self.xml_parser
  # https://taimoorchangaizpucitian.wordpress.com/2013/05/18/nokogiri-xml-parsing/
    file = "zip_code_to_supervisor_lookup_with_contact_information_rows.xml"
    xml_string = open("#{Rails.root}/#{file}").read
    root = Nokogiri::XML(xml_string)
    entries = root.xpath("response/row/row")
    entries.each do |e|
      district = e.at_xpath("district") # Assume district is filled in
      if Supervisor.exists?(:district => district.text)
        # puts ("The supervisor already exists!")
      else
        entry_hash = {
          district: district.text,
          name: element_value(e, "name"),
          phone_number: attribute_value(:xml_entry => e, :xml_element => "phone", :attribute => "phone_number"), 
          facebook_url: attribute_value(:xml_entry => e, :xml_element => "facebook", :attribute => "url"),  
          email: element_value(e, "email"),
          website_url: attribute_value(:xml_entry => e, :xml_element => "website", :attribute => "url"), 
          twitter: element_value(e, "twitter"),
          address: element_value(e, "address")
        }
        new_record = Supervisor.create(entry_hash)
      end # if Supervisor exists
    end # entries each do
  end # self.xml_parser

  # =======================================================
  private

  def self.element_value(xml_entry, xml_element)
    if xml_entry.at_xpath(xml_element).nil?
      return ""
    else 
      return xml_entry.at_xpath(xml_element).text
    end
  end # element_value

  def self.attribute_value(args)
    @xml_entry = args[:xml_entry]
    @xml_element = args[:xml_element]
    @attribute = args[:attribute]
    if @xml_entry.at_xpath(@xml_element).attribute(@attribute).nil?
      return ""
    else 
      return @xml_entry.at_xpath(@xml_element).attribute(@attribute).text
    end
  end

end #Class Supervisor
