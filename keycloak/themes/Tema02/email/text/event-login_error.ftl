<#assign fullName = (user.firstName!"") + (user.lastName?has_content?then(" " + user.lastName, ""))>
🔒 ALERTA DE SEGURANÇA
===============================================

Olá ${fullName?trim?has_content?then(fullName, user.username)},

Detectamos uma tentativa de acesso à sua conta que não foi bem-sucedida.

🔐 O QUE FAZER AGORA?
---------------------

✓ Se FOI VOCÊ quem tentou acessar:
  Não se preocupe. Verifique se digitou a senha corretamente e tente novamente.

✓ Se NÃO FOI VOCÊ:
  Recomendamos que altere sua senha imediatamente através da opção 
  "Esqueci minha senha" na página de login.

💡 DICA DE SEGURANÇA:
Use uma senha forte com pelo menos 8 caracteres, combinando letras maiúsculas, 
minúsculas, números e símbolos. Nunca compartilhe sua senha com ninguém.

===============================================
POWERED BY ABA Blockchain
