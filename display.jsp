<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
private String escapeHtml(String value) {
    if (value == null) return "";
    return value.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#x27;");
}
%>
<%
Object verified = request.getAttribute("verified");
String name = (String) request.getAttribute("verifiedName");
String email = (String) request.getAttribute("verifiedEmail");
String summary = (String) request.getAttribute("verifiedSummary");
boolean canDisplay = Boolean.TRUE.equals(verified)
        && name != null && email != null && summary != null
        && name.matches("^[A-Z][A-Za-z ]{0,8}$")
        && email.matches("^[A-Za-z0-9._%+-]+@gmail\\.com$")
        && !summary.trim().isEmpty();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title><%= canDisplay ? "Summary Verified" : "Verification Required" %> | Java Summary Project</title>
  <style>
    :root { --navy: #17324d; --blue: #286da8; --pale: #eef5fb; --ink: #243447; }
    * { box-sizing: border-box; }
    body { margin: 0; background: var(--pale); color: var(--ink); font: 16px/1.6 Arial, sans-serif; }
    header { background: var(--navy); color: white; padding: 26px 20px; text-align: center; }
    header h1 { margin: 0; }
    main { width: min(700px, calc(100% - 32px)); margin: 30px auto; background: white; border-radius: 8px; padding: 24px; box-shadow: 0 2px 8px #17324d12; }
    .summary { border-left: 4px solid var(--blue); background: var(--pale); padding: 14px; overflow-wrap: anywhere; }
    a { color: var(--blue); }
  </style>
</head>
<body>
  <header><h1><%= canDisplay ? "Verification Successful" : "Verification Required" %></h1></header>
  <main>
    <% if (canDisplay) { %>
      <p>Your summary has passed the required checks.</p>
      <p><strong>Name:</strong> <%= escapeHtml(name) %></p>
      <p><strong>Email ID:</strong> <%= escapeHtml(email) %></p>
      <p><strong>Submitted summary:</strong></p>
      <div class="summary"><%= escapeHtml(summary).replace("\r\n", "\n").replace("\r", "\n").replace("\n", "<br>") %></div>
    <% } else { %>
      <p>This page can only show a summary after it has been submitted and verified.</p>
      <p><a href="test.html">Go to the test form</a></p>
    <% } %>
    <p><a href="about.html">Return to About Java</a></p>
  </main>
</body>
</html>
