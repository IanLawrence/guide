require(["gitbook", "jQuery"], function(gitbook, jQuery) {

  // Guides dropdown
  var $link = $(
    '<a class="btn" aria-label="Switch Documentation" id="guide-dropdown" href="#"></a>'
    ).html('<span>Guides</span> <i class="fa fa-angle-down"></i>');

  var $dropdown = $(
    '<ul class="dropdown-menu guides-list" role="menu" aria-labelledby="guide-dropdown"></ul>'
  ).append(
    '<li role="presentation"><a role="menuitem" tabindex="-1" href="https://rapidftr.github.io/guide/deploy">Deploy</a></li>'
  ).append(
    '<li role="presentation"><a role="menuitem" tabindex="-1" href="https://rapidftr.github.io/guide/admin">Administer</a></li>'
  ).append(
    '<li role="presentation"><a role="menuitem" tabindex="-1" href="https://rapidftr.github.io/guide/use">Use</a></li>'
  ).append(
    '<li role="presentation"><a role="menuitem" tabindex="-1" href="https://rapidftr.github.io/guide/api">Integrate</a></li>'
  );

  var $wrapper = $(
    '<div class="dropdown pull-right"></div>'
  ).append($link).append($dropdown);

  function insertLink() {
    var wrapper = $wrapper.clone();
    wrapper.insertBefore(".book-header h1");
    wrapper.find("#guide-dropdown").click(function() {
      wrapper.find(".dropdown-menu").toggle();
    });
  }

  gitbook.events.bind("page.change", insertLink);

});
