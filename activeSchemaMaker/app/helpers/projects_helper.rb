module ProjectsHelper

  def get_table_names(tables)
    table_names = tables.map {|table| table.name} unless tables.nil? || tables == ["No Tables"]
  end

  def select_menu_table_names(tables)
    if tables.nil?
      return [["No Tables" => '']]
    else
      tables.map {|table| [table.name, table.id] }.select{|option| !option[0].nil? }
    end
  end

end
