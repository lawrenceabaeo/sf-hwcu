class Cleanup < ActiveRecord::Base
  validates :case_id, uniqueness: true

  # Yes, had to use 'their_district' because I already made a column called 'district', which is exactly the conventional way of referring to the class...and I was too lazy to alter the existing column name
  belongs_to :cleanup_district, :class_name => "District", :primary_key => "district_number", :foreign_key => "supervisor_district"

  def self.xml_parser
  # https://taimoorchangaizpucitian.wordpress.com/2013/05/18/nokogiri-xml-parsing/
    file = "human_waste_rows.xml"
    xml_string = open("#{Rails.root}/#{file}").read
    root = Nokogiri::XML(xml_string)
    entries = root.xpath("response/row/row")
    entries.each do |e|
      case_id = e.at_xpath("case_id") # Assume case_id is filled in
      if Cleanup.exists?(:case_id => case_id.text)
        # puts ("The case already exists!")
      else
        entry_hash = {
          case_id: case_id.text,
          case_opened: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "opened"),
          case_closed: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "closed"),
          status: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "status"),
          responsible_agency: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "responsible_agency"),
          address: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "address"),
          category: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "category"),
          request_type: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "request_type"),
          request_details: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "request_details"),
          source: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "source"),
          supervisor_district: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "supervisor_district"),
          neighborhood: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "neighborhood"),
          case_updated: ApplicationController.helpers.element_value(
            xml_entry: e, xml_element: "updated"),
          latitude: ApplicationController.helpers.attribute_value(
            xml_entry: e, xml_element: "point", attribute: "latitude"),
          longitude: ApplicationController.helpers.attribute_value(
            xml_entry: e, xml_element: "point", attribute: "longitude")
        }
        new_record = Cleanup.create(entry_hash)
      end # if Cleanup exists
    end # entries each do
  end # self.xml_parser

end #Class Cleanup
