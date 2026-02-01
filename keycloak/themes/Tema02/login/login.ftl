<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
  
  <#if section = "pageTitle">
    ${msg("loginPageTitle")}
  
  <#elseif section = "header">
    ${msg("loginPageSubtitle")}
  
  <#elseif section = "form">
    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="login-form">
      
      <!-- Campo CPF/CNPJ -->
      <div class="form-group">
        <label for="username" class="form-label">
          ${msg("usernameLabel")}
        </label>
        <input 
          tabindex="1" 
          id="username" 
          class="form-input" 
          name="username" 
          type="text"
          autocomplete="username"
          placeholder="${msg("usernamePlaceholder")}"
          autofocus
          <#if usernameEditDisabled??>disabled</#if>
          <#if login.username??>value="${login.username}"</#if>
          <#if messagesPerField.existsError('username','password')>
            aria-invalid="true"
          </#if>
          required
        />
        <#if messagesPerField.existsError('username','password')>
          <div class="error-message">
            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
          </div>
        </#if>
      </div>

      <!-- Campo Senha -->
      <div class="form-group">
        <label for="password" class="form-label">
          ${msg("password")}
        </label>
        <div class="password-wrapper">
          <input 
            tabindex="2" 
            id="password" 
            class="form-input" 
            name="password" 
            type="password"
            autocomplete="current-password"
            placeholder="${msg("passwordPlaceholder")}"
            <#if messagesPerField.existsError('username','password')>
              aria-invalid="true"
            </#if>
            required
          />
          <button 
            type="button" 
            class="password-toggle" 
            id="password-toggle"
            aria-label="${msg("showPassword")}"
          >
            <svg id="eye-icon" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"/>
              <circle cx="12" cy="12" r="3"/>
            </svg>
            <svg id="eye-off-icon" style="display: none;" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"/>
              <line x1="1" y1="1" x2="23" y2="23"/>
            </svg>
          </button>
        </div>
      </div>

      <!-- Opções do formulário -->
      <div class="form-options">
        <#if realm.rememberMe && !usernameEditDisabled??>
          <label class="checkbox-wrapper">
            <input 
              tabindex="3" 
              id="rememberMe" 
              name="rememberMe" 
              type="checkbox"
              <#if login.rememberMe??>checked</#if>
            />
            <span class="checkbox-custom"></span>
            <span class="checkbox-label">${msg("rememberMe")}</span>
          </label>
        <#else>
          <span></span>
        </#if>

        <#if realm.resetPasswordAllowed>
          <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="form-link">
            ${msg("doForgotPassword")}
          </a>
        </#if>
      </div>

      <!-- Botão de submit -->
      <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
      <button 
        tabindex="4" 
        class="btn-submit" 
        name="login" 
        id="kc-login" 
        type="submit"
      >
        <span class="btn-text">Entrar</span>
      </button>
    </form>

    <script>
      // Toggle de senha
      document.addEventListener('DOMContentLoaded', function() {
        const passwordInput = document.getElementById('password');
        const toggleButton = document.getElementById('password-toggle');
        const eyeIcon = document.getElementById('eye-icon');
        const eyeOffIcon = document.getElementById('eye-off-icon');
        const usernameInput = document.getElementById('username');
        const form = document.getElementById('kc-form-login');
        const submitButton = document.getElementById('kc-login');

        if (toggleButton) {
          toggleButton.addEventListener('click', function() {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            
            if (type === 'text') {
              eyeIcon.style.display = 'none';
              eyeOffIcon.style.display = 'block';
              toggleButton.setAttribute('aria-label', '${msg("hidePassword")}');
            } else {
              eyeIcon.style.display = 'block';
              eyeOffIcon.style.display = 'none';
              toggleButton.setAttribute('aria-label', '${msg("showPassword")}');
            }
          });
        }

        // Máscara de CPF/CNPJ
        if (usernameInput) {
          function applyCpfCnpjMask() {
            let value = usernameInput.value.replace(/\D/g, "");
            if (value.length > 14) value = value.slice(0, 14);
            
            if (value.length <= 11) {
              // CPF: 000.000.000-00
              value = value.replace(/(\d{3})(\d)/, "$1.$2");
              value = value.replace(/(\d{3})(\d)/, "$1.$2");
              value = value.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
            } else {
              // CNPJ: 00.000.000/0000-00
              value = value.replace(/^(\d{2})(\d)/, "$1.$2");
              value = value.replace(/^(\d{2})\.(\d{3})(\d)/, "$1.$2.$3");
              value = value.replace(/\.(\d{3})(\d)/, ".$1/$2");
              value = value.replace(/(\d{4})(\d{1,2})$/, "$1-$2");
            }
            
            usernameInput.value = value;
          }

          // Aplica máscara no valor inicial se existir
          if (usernameInput.value) {
            applyCpfCnpjMask();
          }

          usernameInput.addEventListener("input", applyCpfCnpjMask);

          usernameInput.addEventListener("keydown", function(event) {
            const allowedKeys = ["Backspace", "Tab", "ArrowLeft", "ArrowRight", "Delete"];
            const isCtrlCombo = event.ctrlKey || event.metaKey;

            if (!/[0-9]/.test(event.key) && !allowedKeys.includes(event.key) && !isCtrlCombo) {
              event.preventDefault();
            }
          });

          // Remove máscara e ativa loading no submit
          if (form && submitButton) {
            form.addEventListener('submit', function(e) {
              // Remove máscara do CPF
              usernameInput.value = usernameInput.value.replace(/\D/g, "");
              
              // Ativa estado de loading
              submitButton.disabled = true;
              submitButton.classList.add('loading');
              
              const btnText = submitButton.querySelector('.btn-text');
              
              if (btnText) btnText.textContent = 'Entrando...';
            });
          }
        }
      });
    </script>
  
  <#elseif section = "footer">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
      <p class="footer-text">
        Novo usuário?
        <a tabindex="6" href="https://app.abablockchain.io/nova-conta">
          Criar conta
        </a>
      </p>
    </#if>
  
  </#if>
</@layout.registrationLayout>
