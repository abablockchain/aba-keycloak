<#import "components/document.ftl" as document>
<#import "components/logo.ftl" as logo>

<#macro
  registrationLayout
  displayInfo=false
  displayMessage=true
  displayRequiredFields=false
  showAnotherWayIfPresent=true
>
  <!DOCTYPE html>
  <html lang="${(locale.currentLanguageTag)!'pt-BR'}">
    <head>
      <@document.kw />
    </head>
    <body>
      <div class="login-container">
        <!-- Painel lateral esquerdo (desktop) -->
        <div class="login-sidebar">
          <!-- Pattern decorativo -->
          <div class="sidebar-pattern">
            <div class="circle-1"></div>
            <div class="circle-2"></div>
            <div class="ring-1"></div>
            <div class="ring-2"></div>
          </div>

          <!-- Logo -->
          <@logo.kw variant="light" />

          <!-- Conteúdo -->
          <div class="sidebar-content">
            <div>
              <h1 class="sidebar-title">
                ${msg("sidebarTitle")?no_esc}
              </h1>
              <p class="sidebar-description">
                ${msg("sidebarDescription")}
              </p>
            </div>

            <!-- Features -->
            <div class="sidebar-features">
              <div class="feature-item">
                <div class="feature-icon">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M21 16V8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16z"/>
                    <polyline points="7.5 4.21 12 6.81 16.5 4.21"/>
                    <polyline points="7.5 19.79 7.5 14.6 3 12"/>
                    <polyline points="21 12 16.5 14.6 16.5 19.79"/>
                    <polyline points="3.27 6.96 12 12.01 20.73 6.96"/>
                    <line x1="12" y1="22.08" x2="12" y2="12"/>
                  </svg>
                </div>
                <span class="feature-text">${msg("featureBpms")?no_esc}</span>
              </div>
              <div class="feature-item">
                <div class="feature-icon">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M14.5 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V7.5L14.5 2z"/>
                    <polyline points="14 2 14 8 20 8"/>
                    <line x1="16" y1="13" x2="8" y2="13"/>
                    <line x1="16" y1="17" x2="8" y2="17"/>
                    <polyline points="10 9 9 9 8 9"/>
                  </svg>
                </div>
                <span class="feature-text">${msg("featureSignature")?no_esc}</span>
              </div>
              <div class="feature-item">
                <div class="feature-icon">
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M22 17H2a3 3 0 0 0 3-3V9a7 7 0 0 1 14 0v5a3 3 0 0 0 3 3zm-8.27 4a2 2 0 0 1-3.46 0"/>
                  </svg>
                </div>
                <span class="feature-text">${msg("featureCloud")?no_esc}</span>
              </div>
            </div>
          </div>

          <!-- Footer -->
          <p class="sidebar-footer">${msg("copyright")}</p>
        </div>

        <!-- Painel principal -->
        <div class="login-main">
          <!-- Logo mobile -->
          <div class="login-header-mobile">
            <@logo.kw variant="light" />
          </div>

          <!-- Conteúdo do login -->
          <div class="login-content">
            <div class="login-wrapper">
              <!-- Header -->
              <div class="login-header">
                <h2 class="login-title">
                  <#nested "pageTitle">
                </h2>
                <p class="login-subtitle">
                  <#nested "header">
                </p>
              </div>

              <!-- Card -->
              <div class="login-card">
                <#if displayMessage && message?has_content && (message.type != "warning" || !isAppInitiatedAction??)>
                  <div class="alert alert-${message.type}">
                    <#if message.type == 'success'><span>✓</span></#if>
                    <#if message.type == 'error'><span>✕</span></#if>
                    ${kcSanitize(message.summary)?no_esc}
                  </div>
                </#if>
                
                <#nested "form">
              </div>

              <!-- Footer -->
              <div class="login-footer">
                <#nested "footer">
                
                <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                  <#-- Selector de idioma simplificado -->
                  <#if locale.supported?size gt 1>
                    <div>
                      <button type="button" class="language-selector" onclick="document.getElementById('kc-locale-dropdown').classList.toggle('hidden')">
                        ${locale.current} ↓
                      </button>
                      <ul id="kc-locale-dropdown" class="hidden" style="list-style: none; padding: 0.5rem 0; background: white; border: 1px solid #e2e8f0; border-radius: 0.5rem; position: absolute; margin-top: 0.5rem; box-shadow: 0 4px 6px rgba(0,0,0,0.1);">
                        <#list locale.supported as l>
                          <li style="padding: 0.5rem 1rem;">
                            <a href="${l.url}" style="color: #1e3a5f; text-decoration: none; display: block;">
                              ${l.label}
                            </a>
                          </li>
                        </#list>
                      </ul>
                    </div>
                  </#if>
                </#if>
              </div>
            </div>
          </div>
        </div>
      </div>
    </body>
  </html>
</#macro>
