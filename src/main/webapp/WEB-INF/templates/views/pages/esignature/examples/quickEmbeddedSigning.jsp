<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="assets/favicon.ico">

    <title>${title}</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.13.1/styles/default.min.css"> -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.13.1/styles/darcula.min.css">
    <!-- Custom styles for this template -->
    <link href="/assets/css.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <a class="navbar-brand"  target="_blank" href="https://developers.docusign.com">DocuSign Developer</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto"></ul>
        <c:if test="${locals.user != null}">
           <span class="navbar-text">
            Welcome ${locals.user.name}
          </span>
        </c:if>
    </div>
</nav>

<div class="container">

    <h4>${example.getExampleName()}</h4>
    <p>${example.getExampleDescription()}</p>
    <c:if test="${showDoc}">
        <p><a target='_blank' href='${documentation}'>Documentation</a> about this example.</p>
    </c:if>

    <jsp:include page="../../links_to_api_methods.jsp" />
    <p>
        ${viewSourceFile}
    </p>

    <form class="eg" action="" method="post" data-busy="form">
        <div class="form-group">
            <label for="signerEmail">Signer Email</label>
            <input type="email" class="form-control" id="signerEmail" name="signerEmail"
                   aria-describedby="emailHelp" placeholder="pat@example.com" required
                   value="${locals.dsConfig.signerEmail}">
            <small id="emailHelp" class="form-text text-muted">${launcherTexts.getHelpingTexts().getEmailWontBeShared()}</small>
        </div>
        <div class="form-group">
            <label for="signerName">Signer Name</label>
            <input type="text" class="form-control" id="signerName" placeholder="Pat Johnson" name="signerName"
                   value="${locals.dsConfig.signerName}" required>
        </div>
        <input type="hidden" name="_csrf" value="${csrfToken}">
        <button type="submit" class="btn btn-docu">${launcherTexts.getSubmitButton()}</button>
    </form>
</div>
</body>
</html>
