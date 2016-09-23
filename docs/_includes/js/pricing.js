var userCounts = {
  "1-10" : "$49<cite>.97</cite>",
  "11-50" : "$39<cite>.82</cite>",
  "51-100" : "$34<cite>.93</cite>"
}
var ready = function($) {

  var $more = $("#Pricing-PriceSegments--more");
  var $hide = $("#Pricing-PriceSegments--close");
  var $show = $("#Pricing-PriceSegments--showMore");
  var $main = $("#Pricing-PriceSegments--devTeams");

  $hide.click(function(event){
    event.stopPropagation();
    event.preventDefault();

    $more.removeClass('in')
    $main.removeClass('open')

    return false;
  });

  $show.click(function(event){
    event.stopPropagation();
    event.preventDefault();

    $more.toggleClass('in')
    $main.toggleClass('open')

    return false;
  });

  $('.contact').click(function(event){
    event.stopPropagation();
    event.preventDefault();

    if (Intercom) {
      Intercom('show')
    }

    return false;
  });

  $(".user-count-select").change(function(event){
    var val = $(this).val()
    var $price = $(this).next().find('.first-line')
    $price.html(userCounts[val])
  });

}

$(document).ready(ready);