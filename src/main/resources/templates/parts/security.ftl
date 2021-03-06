<#assign
known = Session.SPRING_SECURITY_CONTEXT??
>
<#if known>
    <#assign
    user        = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    firstName   = user.getFirstName()
    lastName    = user.getLastName()
    email        = user.getEmail()
    mobile      = user.getUsername()

    isAdmin     = user.isAdmin()
    isUser      = user.isUser()
    >
<#else>
    <#assign
    name        = "unknown"
    isAdmin     = false
    isUser      = false
    >
</#if>