<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Redefinição de Senha</title>
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
                    <td bgcolor="#11998e"
                        style="
                            background-color:#11998e;
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
                            Redefinição de Senha
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
                            Recebemos uma solicitação para redefinir a senha da sua conta.
                        </p>

                        <p>
                            Se foi você quem solicitou, clique no botão abaixo para criar uma nova senha.
                        </p>

                        <!-- Highlight -->
                        <table width="100%" cellpadding="0" cellspacing="0"
                               bgcolor="#f4f7f6"
                               style="margin:20px 0; border-left:4px solid #11998e;">
                            <tr>
                                <td style="padding:15px; font-size:14px;">
                                    ⏰ Este link é válido por
                                    <strong>${linkExpiration}</strong>
                                    minutos.
                                </td>
                            </tr>
                        </table>

                        <!-- Button -->
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="padding:20px 0;">
                                    <a href="${link}"
                                       style="
                                           background-color:#11998e;
                                           color:#ffffff;
                                           padding:14px 32px;
                                           text-decoration:none;
                                           border-radius:30px;
                                           font-weight:bold;
                                           display:inline-block;
                                       ">
                                        Redefinir senha
                                    </a>
                                </td>
                            </tr>
                        </table>

                        <p style="
                            font-size:13px;
                            color:#777777;
                            text-align:center;
                            margin-top:20px;
                        ">
                            Se você não solicitou esta alteração, pode ignorar este e-mail.
                            Sua senha atual continuará válida.
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
