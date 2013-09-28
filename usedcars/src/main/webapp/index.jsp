
<!doctype html>
<html xmlns:ng="http://angularjs.org" ng-app>
  <head>
    <link rel="stylesheet" href="resources/todo.css">
  </head>
  <body data-ng-controller="TodoCtrl">
    <h2>Todo</h2>
    <div>
      <span>{{remaining()}} of {{todos.length}} remaining</span>
      [ <a href="" data-ng-click="archive()">archive</a> ]
      <ul class="unstyled">
        <li data-ng-repeat="todo in todos">
          <input type="checkbox" data-ng-model="todo.done">
          <span class="done-{{todo.done}}">{{todo.text}}</span>
        </li>
      </ul>
      <form data-ng-submit="addTodo()">
        <input type="text" data-ng-model="todoText"  size="30"
               placeholder="add new todo here">
        <input class="btn-primary" type="submit" value="add">
      </form>
    </div>
  </body>
  
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
    <script src="resources/todo.js"></script>
</html>