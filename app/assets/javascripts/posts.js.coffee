jQuery(document).on 'turbolinks:load', -> 
  divisions = $('#post_division_id').html()
  $('#post_region_id').change ->
    region = $('#post_region_id :selected').text()
    options = $(divisions).filter("optgroup[label='#{region}']").html()
    if options
      $('#post_division_id').html(options)
    else
      $('#post_division_id').empty()
