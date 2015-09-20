module FormHelper
  def setup_table(table)
    table.fields ||= Field.new
    table
  end

  def add_object_link(name, form, object, partial, where)
    options = {:parent => true}.merge(options)
    html = render(:partial => partial, :locals => { :form => form}, :object => object)
    link_to_function name, %{
      var new_object_id = new Date().getTime() ;
      var html = jQuery(#{js html}.replace(/index_to_replace_with_js/g, new_object_id)).hide();
      html.appendTo(jQuery("#{where}")).slideDown('slow');
    }
  end

end