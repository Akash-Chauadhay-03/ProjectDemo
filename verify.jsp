<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
request.setCharacterEncoding("UTF-8");

String name = request.getParameter("name");
String email = request.getParameter("email");
String summary = request.getParameter("summary");

if (name == null) name = "";
if (email == null) email = "";
if (summary == null) summary = "";

boolean validName = name.matches("^[A-Z][A-Za-z ]{0,8}$");
boolean validEmail = email.matches("^[A-Za-z0-9._%+-]+@gmail\\.com$");
boolean validSummary = !summary.trim().isEmpty();

if (validName && validEmail && validSummary) {
    request.setAttribute("verified", Boolean.TRUE);
    request.setAttribute("verifiedName", name);
    request.setAttribute("verifiedEmail", email);
    request.setAttribute("verifiedSummary", summary);
    request.getRequestDispatcher("display.jsp").forward(request, response);
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Check Your Submission | Java Summary Project</title>
  <style>
    :root { --navy: #17324d; --blue: #286da8; --pale: #eef5fb; --ink: #243447; --error: #a12626; }
    * { box-sizing: border-box; }
    body { margin: 0; background: var(--pale); color: var(--ink); font: 16px/1.6 Arial, sans-serif; }
    header { background: var(--navy); color: white; padding: 26px 20px; text-align: center; }
    header h1 { margin: 0; }
    main { width: min(650px, calc(100% - 32px)); margin: 30px auto; background: white; border-radius: 8px; padding: 24px; box-shadow: 0 2px 8px #17324d12; }
    li { color: var(--error); margin: 8px 0; }
    a { color: var(--blue); }
  </style>
</head>
<body>
  <header><h1>We Could Not Verify Your Submission</h1></header>
  <main>
    <p>Please return to the form and correct the following:</p>
    <ul>
      <% if (!validName) { %>
        <li>Name must start with an uppercase English letter, contain fewer than 10 characters, and use only English letters and spaces.</li>
      <% } %>
      <% if (!validEmail) { %>
        <li>Email must be a valid address ending with @gmail.com.</li>
      <% } %>
      <% if (!validSummary) { %>
        <li>Summary must not be empty or contain only spaces.</li>
      <% } %>
    </ul>
    <a href="test.html">Return to the test form</a>
  </main>
</body>
</html>
