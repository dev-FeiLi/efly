<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Example</a>
        </div>
    </div>
</nav>

<div class="container">
    <div class="page-header">
        <h1>Login</h1>
    </div>

    <div class="col-md-12" id="error-container"></div>
    <div>
        <div class="form-group">
            <label>username</label>
            <input type="text" name="username" id="username"/>
        </div>
        <div class="form-group">
            <label>password</label>
            <input type="text" name="password" id="password"/>
        </div>
        <div class="form-group">
            <button class="btn btn-default" id="submit">Submit</button>
            <button class="btn btn-default" id="cancel">Cancel</button>
        </div>
    </div>
</div>
</body>
</html>