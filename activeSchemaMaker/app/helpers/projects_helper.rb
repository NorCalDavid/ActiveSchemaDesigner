module ProjectsHelper

  def get_table_names(tables)
    table_names = tables.map {|table| table.name} unless tables.nil? || tables == ["No Tables"]
  end

  def select_menu_table_names(table_names)
    if table_names.nil?
      return ["No Tables"]
    else
      option_values = (1..table_names.length).to_a
      table_names.zip(option_values)
    end
  end

end
