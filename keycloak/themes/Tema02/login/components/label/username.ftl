<#macro kw>
  <#compress>
    <#if !realm.loginWithEmailAllowed>
      CPF ou CNPJ
    <#elseif !realm.registrationEmailAsUsername>
      CPF ou CNPJ
    <#else>
      ${msg("email")}
    </#if>
  </#compress>
</#macro>
