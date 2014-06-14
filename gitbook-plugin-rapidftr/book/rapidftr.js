require(["gitbook", "jQuery"], function(gitbook, jQuery) {

  var $link = $(
    '<a class="btn" aria-label="Switch Documentation" id="guide-dropdown" href="#"></a>'
    ).html('<span>Guides</span> <i class="fa fa-angle-down"></i>');

  var $dropdown = $(
    '<ul class="dropdown-menu guides-list" role="menu" aria-labelledby="guide-dropdown"></ul>'
  ).append(
    '<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Deploy</a></li>'
  ).append(
    '<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Administer</a></li>'
  ).append(
    '<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Use</a></li>'
  ).append(
    '<li role="presentation"><a role="menuitem" tabindex="-1" href="#">Integrate</a></li>'
  );

  var $wrapper = $(
    '<div class="dropdown pull-right"></div>'
  );

  $wrapper.append($link).append($dropdown).insertBefore(".book-header h1");

  $link.click(function() {
    $dropdown.toggle();
  });

});
