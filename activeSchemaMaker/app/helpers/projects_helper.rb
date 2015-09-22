module ProjectsHelper

def get_table_names(tables)
  table_names = tables.map {|table| table.name}
end

  def select_menu_table_names(table_names)
    option_values = (1..table_names.length).to_a
    table_names.zip(option_values)
    end
end
