module ProjectsHelper

  def get_table_names(tables)
    table_names = tables.map {|table| table.name} unless tables.nil? || tables == ["No Tables"]
  end

  def select_menu_table_names(tables)
    tables.map {|table| [table.name, table.id]} unless tables.nil? || tables == ["No Tables", ""]
  end

end
