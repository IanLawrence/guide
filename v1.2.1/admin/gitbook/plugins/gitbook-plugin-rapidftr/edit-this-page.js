require(["gitbook", "utils/url", "jQuery"], function(gitbook, URL, jQuery) {

  var editBaseUrl = $(".contribute-link").attr("href");
  var bookBaseUrl = URL.join(window.location.pathname, $(".book-header h1 a").attr("href"));

  function updateLink() {
    var editPath = window.location.pathname.replace(bookBaseUrl, "");

    if (editPath.indexOf("/") !== 0) editPath = "/" + editPath;
    if (editPath === "/") editPath = editPath + "README.md";
    if (editPath.indexOf("/index.html") >= 0) editPath = editPath.replace("/index.html", "/README.md");
    if (editPath.indexOf(".html") >= 0) editPath = editPath.replace(".html", ".md");
    if (editPath.indexOf(".md", editPath.length - 3) === -1) editPath = editPath + ".md";

    var editUrl = editBaseUrl.replace("/tree/", "/edit/") + editPath;
    $(".contribute-link").attr("href", editUrl);
  }

  gitbook.events.bind("page.change", updateLink);

});
