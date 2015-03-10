angular.module("templates", []).run(["$templateCache", function($templateCache) {$templateCache.put("home.html","<h1>HOME</h1>");
$templateCache.put("ng-app.html","<h1>HELLO</h1>");
$templateCache.put("profile.html","<h1>PROFILE</h1>");}]);