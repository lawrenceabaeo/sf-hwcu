class Supervisor < ActiveRecord::Base
  # Note: For this simple app we are not considering
  # historical supervisors (we are only considering the current 
  # supervisor as of 09-26-2014), or the possibility that two different 
  # districts may have supes may with the same name (ex. John Smith)
  
  validates :district, uniqueness: true

  # Yes, had to use 'their_district' because I already made a column called 'district', which is exactly the conventional way of referring to the class...and I was too lazy to alter the existing column name
  belongs_to :their_district, :class_name => "District", :primary_key => "district_number", :foreign_key => "district"

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
          name: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "name"),
          phone_number: ApplicationController.helpers.attribute_value(
            xml_entry: e, xml_element: "phone", attribute: "phone_number"),
          facebook_url: ApplicationController.helpers.attribute_value(
            xml_entry: e, xml_element: "facebook", attribute: "url"),
          email: ApplicationController.helpers.element_value( 
            xml_entry: e, xml_element: "email"),
          website_url: ApplicationController.helpers.attribute_value(
            xml_entry: e, xml_element: "website", attribute: "url"),
          twitter: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "twitter"),
          address: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "address")
        }
        new_record = Supervisor.create(entry_hash)
      end # if Supervisor exists
    end # entries each do
  end # self.xml_parser

end #Class Supervisor
