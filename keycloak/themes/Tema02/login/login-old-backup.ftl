<script>
document.addEventListener("DOMContentLoaded", function() {
  const usernameInput = document.querySelector('input[name="username"]');
  const passwordInput = document.querySelector('input[name="password"]');
  const eyeIcon = document.querySelector('.anticon-eye');
  const eyeInvisibleIcon = document.querySelector('.anticon-eye-invisible');
  const form = document.querySelector("form");

  function applyCpfCnpjMask() {
    let value = usernameInput.value.replace(/\D/g, "");
    if (value.length > 14) value = value.slice(0, 14);
    if (value.length <= 11) {
      value = value.replace(/(\d{3})(\d)/, "$1.$2");
      value = value.replace(/(\d{3})(\d)/, "$1.$2");
      value = value.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
    } else {
      value = value.replace(/^(\d{2})(\d)/, "$1.$2");
      value = value.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3");
      value = value.replace(/\.(\d{3})(\d)/, ".$1/$2");
      value = value.replace(/(\d{4})(\d{1,2})$/, "$1-$2");
    }
    usernameInput.value = value;
  }

  if (usernameInput) {
    usernameInput.addEventListener("input", applyCpfCnpjMask);

    usernameInput.addEventListener("keydown", function(event) {
      const allowedKeys = ["Backspace", "Tab", "ArrowLeft", "ArrowRight", "Delete"];
      const isCtrlCombo = event.ctrlKey || event.metaKey;

      if (
        !/[0-9]/.test(event.key) &&
        !allowedKeys.includes(event.key) &&
        !isCtrlCombo
      ) {
        event.preventDefault();
      }
    });
  }

  if (form) {
    form.addEventListener("submit", function() {
      if (passwordInput) {
        const event = new Event('input', { bubbles: true });
        passwordInput.dispatchEvent(event);
      }

      if (usernameInput) {
        usernameInput.value = usernameInput.value.replace(/\D/g, "");
      }
    });
  }

  if (eyeIcon && eyeInvisibleIcon && passwordInput) {
    eyeIcon.addEventListener("click", function() {
      passwordInput.type = "text";
      eyeIcon.style.display = "none";
      eyeInvisibleIcon.style.display = "block";
    });

    eyeInvisibleIcon.addEventListener("click", function() {
      passwordInput.type = "password";
      eyeInvisibleIcon.style.display = "none";
      eyeIcon.style.display = "block";
    });
  }
});
</script>


<#import "template.ftl" as layout>
  <#import "components/provider.ftl" as provider>
    <#import "components/button/primary.ftl" as buttonPrimary>
      <#import "components/checkbox/primary.ftl" as checkboxPrimary>
        <#import "components/input/primary.ftl" as inputPrimary>
          <#import "components/label/username.ftl" as labelUsername>
            <#import "components/link/primary.ftl" as linkPrimary>
              <@layout.registrationLayout
                displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??
                displayMessage=!messagesPerField.existsError("username", "password" )
                ;
                section>
                <#if section="header">
                  ${msg("loginAccountTitle")}
                  <#elseif section="form">
                    <#if realm.password>
                      <form
                        style="display: flex;flex-direction: column;justify-content: center;align-items: center;"
                        action="${url.loginAction}"
                        class="m-0 space-y-4"
                        method="post"
                        onsubmit="login.disabled = true; return true;">
                        <input
                          name="credentialId"
                          type="hidden"
                          value="<#if auth.selectedCredential?has_content>
${auth.selectedCredential}
</#if>">
                        <div>
                          <@inputPrimary.kw
                            autocomplete=realm.loginWithEmailAllowed?string("email", "username" )
                            autofocus=true
                            disabled=usernameEditDisabled??
                            invalid=["username", "password" ]
                            name="username"
                            type="text"
                            value=(login.username)!''
                            maxlength="18">
                            <@labelUsername.kw />
                          </@inputPrimary.kw>
                        </div>
                        <div style="position: relative; width: 100%;">
                          <@inputPrimary.kw
                            invalid=["username", "password" ]
                            message=false
                            name="password"
                            type="password">
                            Senha
                          </@inputPrimary.kw>
                          <span style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); cursor: pointer;">
                            <svg class="anticon-eye" width="1em" height="1em" viewBox="64 64 896 896" focusable="false" fill="currentColor" aria-hidden="true" style="display: block;">
                              <path d="M942.2 486.2C847.4 286.5 704.1 186 512 186c-192.2 0-335.4 100.5-430.2 300.3a60.3 60.3 0 000 51.5C176.6 737.5 319.9 838 512 838c192.2 0 335.4-100.5 430.2-300.3 7.7-16.2 7.7-35 0-51.5zM512 766c-161.3 0-279.4-81.8-362.7-254C232.6 339.8 350.7 258 512 258c161.3 0 279.4 81.8 362.7 254C791.5 684.2 673.4 766 512 766zm-4-430c-97.2 0-176 78.8-176 176s78.8 176 176 176 176-78.8 176-176-78.8-176-176-176zm0 288c-61.9 0-112-50.1-112-112s50.1-112 112-112 112 50.1 112 112-50.1 112-112 112z"></path>
                            </svg>
                            <svg class="anticon-eye-invisible" width="1em" height="1em" viewBox="64 64 896 896" focusable="false" fill="currentColor" aria-hidden="true" style="display: none;">
                              <path d="M942.2 486.2Q889.47 375.11 816.7 305l-50.88 50.88C807.31 395.53 843.45 447.4 874.7 512 791.5 684.2 673.4 766 512 766q-72.67 0-133.87-22.38L323 798.75Q408 838 512 838q288.3 0 430.2-300.3a60.29 60.29 0 000-51.5zm-63.57-320.64L836 122.88a8 8 0 00-11.32 0L715.31 232.2Q624.86 186 512 186q-288.3 0-430.2 300.3a60.3 60.3 0 000 51.5q56.69 119.4 136.5 191.41L112.48 835a8 8 0 000 11.31L155.17 889a8 8 0 0011.31 0l712.15-712.12a8 8 0 000-11.32zM149.3 512C232.6 339.8 350.7 258 512 258c54.54 0 104.13 9.36 149.12 28.39l-70.3 70.3a176 176 0 00-238.13 238.13l-83.42 83.42C223.1 637.49 183.3 582.28 149.3 512zm246.7 0a112.11 112.11 0 01146.2-106.69L401.31 546.2A112 112 0 01396 512z"></path>
                              <path d="M508 624c-3.46 0-6.87-.16-10.25-.47l-52.82 52.82a176.09 176.09 0 00227.42-227.42l-52.82 52.82c.31 3.38.47 6.79.47 10.25a111.94 111.94 0 01-112 112zm207.94-148.17L717.69 670l-29.14 29.14c6.01 1.01 12.07 1.53 18.45 1.53 97.2 0 176-78.8 176-176 0-6.38-.52-12.44-1.53-18.45z"></path>
                            </svg>
                          </span>
                        </div>
                        <div class="flex items-center" style="display: flex; justify-between: center; align-items: center; gap: 43px;">
                          <#if realm.rememberMe && !usernameEditDisabled??>
                            <@checkboxPrimary.kw checked=login.rememberMe?? name="rememberMe">
                              ${msg("rememberMe")}
                            </@checkboxPrimary.kw>
                          </#if>
                        </div>
                        <div class="flex items-center" style="display: flex; justify-between: center; align-items: center; gap: 43px;">
                          <#if realm.resetPasswordAllowed>
                            <@linkPrimary.kw href=url.loginResetCredentialsUrl>
                              <span class="text-sm">Esqueceu a senha?</span>
                            </@linkPrimary.kw>
                          </#if>
                        </div>
                        <div class="pt-4">
                          <@buttonPrimary.kw name="login" type="submit">
                            ${msg("doLogIn")}
                          </@buttonPrimary.kw>
                        </div>
                      </form>
                    </#if>
                    <#-- <#if realm.password && social.providers??>
                      <@provider.kw />
                </#if> -->
                <#elseif section="info">
                  <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <div class="text-center">
                      ${msg("noAccount")}
                      <@linkPrimary.kw href="https://app.abablockchain.io/nova-conta">
                        ${msg("doRegister")}
                      </@linkPrimary.kw>
                    </div>
                  </#if>
                  </#if>
              </@layout.registrationLayout>