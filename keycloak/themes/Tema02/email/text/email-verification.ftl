<#-- Nome completo com fallback -->
<#assign fullName = (user.firstName!"") + (user.lastName?has_content?then(" " + user.lastName, ""))>

<#-- Expiração do link (em minutos) -->
<#assign expirationMinutes = linkExpiration?number>
<#assign expirationHours = (expirationMinutes / 60)?floor>
<#assign expirationDays  = (expirationMinutes / 1440)?floor>

Olá ${fullName?trim?has_content?then(fullName, user.username)},

Recebemos uma solicitação que exige a confirmação do seu endereço de e-mail.

Para concluir esta ação, acesse o link abaixo:

${link}

Este link é válido por <#if expirationMinutes gte 1440>
${expirationDays} dia<#if expirationDays gt 1>s</#if>
<#elseif expirationMinutes gt 60>
${expirationHours} hora<#if expirationHours gt 1>s</#if>
<#else>
${expirationMinutes} minuto<#if expirationMinutes gt 1>s</#if>
</#if>.

Se você não solicitou esta ação, ignore esta mensagem.

POWERED BY ABA Blockchain
