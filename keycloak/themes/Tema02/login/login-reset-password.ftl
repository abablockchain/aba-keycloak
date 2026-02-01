<#import "template.ftl" as layout>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/label/username.ftl" as labelUsername>
<#import "components/link/secondary.ftl" as linkSecondary>

<@layout.registrationLayout
  displayInfo=true
  displayMessage=!messagesPerField.existsError("username")
  ;
  section
>
  <#if section="header">
    ${msg("emailForgotTitle")}
  <#elseif section="form">
    <div class="reset-password-info">
      <p class="info-title">Recuperação de Senha</p>
      <p class="info-text">Digite seu CPF ou CNPJ cadastrado para receber um e-mail com instruções de redefinição de senha.</p>
      <p class="info-detail">Você receberá um e-mail no endereço cadastrado com um link para criar uma nova senha.</p>
    </div>
    
    <form action="${url.loginAction}" method="post" class="flex flex-col items-center justify-center space-y-4 w-full">
      <div class="w-full">
        <@inputPrimary.kw
          autocomplete=realm.loginWithEmailAllowed?string("email", "username")
          autofocus=true
          invalid=["username"]
          name="username"
          type="text"
          maxlength="18"
          value=(auth?has_content && auth.showUsername())?then(auth.attemptedUsername, '')
        >
          <@labelUsername.kw />
        </@inputPrimary.kw>
      </div>
      <div class="w-full">
        <@buttonPrimary.kw type="submit">
          ${msg("doSubmit")}
        </@buttonPrimary.kw>
      </div>
    </form>
    
    <div class="text-center" style="margin-top: 1.5rem;">
      <a href="${url.loginUrl}" class="form-link" style="font-size: 0.875rem;">
        ← Voltar para o login
      </a>
    </div>
  <#elseif section="info">
    ${msg("emailInstruction")}
  <#elseif section="nav">
    <@linkSecondary.kw href=url.loginUrl>
      <span class="text-sm">${kcSanitize(msg("backToLogin"))?no_esc}</span>
    </@linkSecondary.kw>
  </#if>
</@layout.registrationLayout>

<script>
  document.addEventListener('DOMContentLoaded', function () {
    const input = document.querySelector('input[name="username"]');
    const form = document.querySelector('form');
    const button = form.querySelector('button');

    if (!input || !form || !button) return;

    // Máscara CPF/CNPJ simples
    input.addEventListener('input', function () {
      let value = input.value.replace(/\D/g, '');

      if (value.length <= 11) {
        // CPF: 000.000.000-00
        value = value.replace(/(\d{3})(\d)/, '$1.$2');
        value = value.replace(/(\d{3})(\d)/, '$1.$2');
        value = value.replace(/(\d{3})(\d{1,2})$/, '$1-$2');
      } else {
        // CNPJ: 00.000.000/0000-00
        value = value.replace(/^(\d{2})(\d)/, '$1.$2');
        value = value.replace(/^(\d{2})\.(\d{3})(\d)/, '$1.$2.$3');
        value = value.replace(/\.(\d{3})(\d)/, '.$1/$2');
        value = value.replace(/(\d{4})(\d{1,2})$/, '$1-$2');
      }

      input.value = value;
    });

    // Remove máscara ao submeter e mostra loading
    form.addEventListener('submit', function () {
      const rawValue = input.value.replace(/\D/g, '');
      input.value = rawValue;

      input.dataset.submitted = "true";

      button.disabled = true;
      button.innerHTML = '<span class="loader mr-2"></span> ${msg("emailInstructionSubmit")?no_esc}';
    });
  });
</script>

<style>
  .loader {
    border: 2px solid #f3f3f3;
    border-top: 2px solid #555;
    border-radius: 50%;
    width: 14px;
    height: 14px;
    animation: spin 1s linear infinite;
    display: inline-block;
    vertical-align: middle;
    margin-right: 6px;
  }

  @keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
  }
</style>
