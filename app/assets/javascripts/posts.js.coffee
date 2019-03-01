jQuery(document).on 'turbolinks:load', -> 
  $('.right-number-group').hide()
  $('.irrigation-company-group').hide()
  $('.step-radio').change ->
    if @value is "acre_foot"
      $(".right-number-group").show()
      $(".irrigation-company-group").hide()
    else if @value is "share"
      $(".right-number-group").hide()
      $(".irrigation-company-group").show()

jQuery(document).on 'turbolinks:load', -> 
  divisions = $('#post_division_id').html()
  $('#post_region_id').change ->
    region = $('#post_region_id :selected').text()
    options = $(divisions).filter("optgroup[label='#{region}']").html()
    if options
      $('#post_division_id').html(options)
    else
      $('#post_division_id').empty()

jQuery(document).on 'turbolinks:load', -> 
  $(".post-region").change ->
    filterValue = $(this).val()
    $(".post").hide()
    $(".post").each (index, element) =>
      if $(element).attr('data-type') == filterValue
        $(element).show()
    if filterValue == "All"
      $(".post").each (index, element) =>
        $(element).show()

  $(".post-division").change ->
    filterValue = $(this).val()
    $(".post").hide()
    $(".post").each (index, element) =>
      if $(element).attr('id') == filterValue
        $(element).show()