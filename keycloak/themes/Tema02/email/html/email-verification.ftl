<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Confirmação de e-mail</title>
</head>
<body style="margin:0; padding:0; background-color:#f4f7f6; font-family: Arial, Helvetica, sans-serif;">

<#-- Nome completo com fallback seguro -->
<#assign fullName = (user.firstName!"") + (user.lastName?has_content?then(" " + user.lastName, ""))>

<#-- Expiração do link (Keycloak envia em minutos) -->
<#assign expirationMinutes = linkExpiration?number>
<#assign expirationHours = (expirationMinutes / 60)?floor>
<#assign expirationDays  = (expirationMinutes / 1440)?floor>

<table width="100%" cellpadding="0" cellspacing="0" style="background-color:#f4f7f6; padding:20px;">
    <tr>
        <td align="center">
            <table width="600" cellpadding="0" cellspacing="0"
                   style="background-color:#ffffff; border-radius:12px; overflow:hidden;">

                <!-- Logo -->
                <tr>
                    <td align="center" style="padding:20px;">
                        <img src="${properties.logoClient!''}"
                             alt="Logo"
                             style="max-width:180px;">
                    </td>
                </tr>

                <!-- Header -->
                <tr>
                    <td align="center"
                        style="background-color:#11998e; color:#ffffff; padding:30px;">
                        <h1 style="margin:0; font-size:26px;">
                            Confirmação de E-mail
                        </h1>
                    </td>
                </tr>

                <!-- Content -->
                <tr>
                    <td style="padding:30px; color:#333; line-height:1.6; font-size:15px;">

                        <p>
                            Olá
                            <strong>
                                ${fullName?trim?has_content?then(fullName, user.username)}
                            </strong>,
                        </p>

                        <p>
                            Recebemos uma solicitação que exige a confirmação do seu endereço de e-mail.
                        </p>

                        <p>
                            Para concluir esta ação, confirme seu e-mail clicando no botão abaixo.
                        </p>

                        <!-- Highlight -->
                        <div style="background-color:#f4f7f6;
                                    border-left:4px solid #11998e;
                                    padding:15px;
                                    margin:20px 0;">
                            <p style="margin:0;">
                                ⏰ Este link é válido por
                                <strong>
                                    <#if expirationMinutes gte 1440>
                                        ${expirationDays}
                                        dia<#if expirationDays gt 1>s</#if>
                                    <#elseif expirationMinutes gt 60>
                                        ${expirationHours}
                                        hora<#if expirationHours gt 1>s</#if>
                                    <#else>
                                        ${expirationMinutes}
                                        minuto<#if expirationMinutes gt 1>s</#if>
                                    </#if>
                                </strong>.
                            </p>
                        </div>

                        <!-- Button -->
                        <p style="text-align:center; margin:30px 0;">
                            <a href="${link}"
                               style="
                                   background-color:#11998e;
                                   color:#ffffff;
                                   padding:14px 30px;
                                   text-decoration:none;
                                   border-radius:30px;
                                   font-weight:bold;
                                   display:inline-block;
                               ">
                                Confirmar e-mail
                            </a>
                        </p>

                        <p style="font-size:13px; color:#777; text-align:center;">
                            Se você não solicitou esta ação, pode ignorar este e-mail com segurança.
                        </p>

                    </td>
                </tr>

                <!-- Footer -->
                <tr>
                    <td align="center"
                        style="background-color:#f4f7f6;
                               padding:15px;
                               font-size:12px;
                               color:#888;">
                        POWERED BY ABA Blockchain
                    </td>
                </tr>

            </table>
        </td>
    </tr>
</table>

</body>
</html>
