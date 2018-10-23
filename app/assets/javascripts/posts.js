jQuery(function() {
  var divisions;
  divisions = $('#post_division_id').html();
  console.log(divisions);
  return $('#post_region_id').change(function() {
    var region, options;
    region = $('#post_region_id :selected').text();
    options = $(divisions).filter("optgroup[label=" + region + "]").html();
    console.log(options);
    if (options) {
      return $('#post_division_id').html(options);
    } else {
      return $('#post_division_id').empty();
    }
  });
});

