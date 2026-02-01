<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Alerta de Segurança</title>
</head>

<body style="margin:0; padding:0; background-color:#f4f7f6; font-family: Arial, Helvetica, sans-serif;">

<#-- Nome completo com fallback -->
<#assign fullName = (user.firstName!"") + (user.lastName?has_content?then(" " + user.lastName, ""))>

<table width="100%" cellpadding="0" cellspacing="0" bgcolor="#f4f7f6" style="padding:20px;">
    <tr>
        <td align="center">

            <table width="600" cellpadding="0" cellspacing="0"
                   bgcolor="#ffffff"
                   style="background-color:#ffffff; border-radius:12px; overflow:hidden;">

                <!-- Logo -->
                <tr>
                    <td align="center" style="padding:20px;">
                        <img src="${properties.logoClient!''}"
                             alt="Logo"
                             style="max-width:180px; display:block;">
                    </td>
                </tr>

                <!-- Header (OUTLOOK SAFE) -->
                <tr>
                    <td bgcolor="#ef4444"
                        style="
                            background-color:#ef4444;
                            color:#ffffff;
                            padding:30px;
                            text-align:center;
                        ">
                        <h1 style="
                            margin:0;
                            font-size:26px;
                            font-weight:bold;
                            color:#ffffff;
                        ">
                            🔒 Alerta de Segurança
                        </h1>
                    </td>
                </tr>

                <!-- Content -->
                <tr>
                    <td style="
                        padding:30px;
                        color:#333333;
                        line-height:1.6;
                        font-size:15px;
                    ">

                        <p>
                            Olá
                            <strong>
                                ${fullName?trim?has_content?then(fullName, user.username)}
                            </strong>,
                        </p>

                        <p>
                            Detectamos uma tentativa de acesso à sua conta que não foi bem-sucedida.
                        </p>

                        <!-- Highlight -->
                        <table width="100%" cellpadding="0" cellspacing="0"
                               bgcolor="#fef2f2"
                               style="margin:20px 0; border-left:4px solid #ef4444; border-radius:4px;">
                            <tr>
                                <td style="padding:15px;">
                                    <p style="margin:0; font-weight:bold; color:#991b1b; font-size:14px;">
                                        ⚠️ Alerta de segurança: Foi detectada uma tentativa de login sem sucesso em sua conta.
                                    </p>
                                </td>
                            </tr>
                        </table>

                        <p style="font-weight:bold; color:#991b1b;">
                            🔐 O que fazer agora?
                        </p>

                        <ul style="color:#333333; line-height:1.8;">
                            <li>Se <strong>foi você</strong> quem tentou acessar, não se preocupe. Verifique se digitou a senha corretamente e tente novamente.</li>
                            <li>Se <strong>não foi você</strong>, recomendamos que altere sua senha imediatamente através da opção "Esqueci minha senha" na página de login.</li>
                        </ul>

                        <p style="
                            font-size:13px;
                            color:#777777;
                            background-color:#f8fafc;
                            padding:15px;
                            border-radius:6px;
                            margin-top:20px;
                        ">
                            💡 <strong>Dica de segurança:</strong> Use uma senha forte com pelo menos 8 caracteres, 
                            combinando letras maiúsculas, minúsculas, números e símbolos. Nunca compartilhe sua senha com ninguém.
                        </p>

                    </td>
                </tr>

                <!-- Footer -->
                <tr>
                    <td bgcolor="#f4f7f6"
                        style="
                            background-color:#f4f7f6;
                            padding:15px;
                            font-size:12px;
                            color:#888888;
                            text-align:center;
                        ">
                        POWERED BY ABA Blockchain
                    </td>
                </tr>

            </table>

        </td>
    </tr>
</table>

</body>
</html>
