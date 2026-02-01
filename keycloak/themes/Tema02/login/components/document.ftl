<#macro kw>
  <title>${msg("loginTitle", (realm.displayName!""))}</title>

  <meta charset="utf-8" />
  <meta name="robots" content="noindex, nofollow" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Favicon -->
  <link rel="icon" type="image/svg+xml" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 48 48'%3E%3Crect width='48' height='48' rx='8' fill='%231e3a5f'/%3E%3Cpath d='M24 10L38 17V31L24 38L10 31V17L24 10Z' fill='%23ffffff'/%3E%3Cpath d='M24 10L38 17V31L24 38L10 31V17L24 10Z' stroke='%231e3a5f' stroke-width='2' fill='none'/%3E%3Cpath d='M24 10V24M24 24L10 17M24 24L38 17M24 24V38' stroke='%231e3a5f' stroke-width='2'/%3E%3C/svg%3E" />

  <#if properties.meta?has_content>
    <#list properties.meta?split(" ") as meta>
      <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
    </#list>  
  </#if>

  <#if properties.favicons?has_content>
    <#list properties.favicons?split(" ") as favicon>
      <link href="${url.resourcesPath}/${favicon?split('==')[0]}" rel="${favicon?split('==')[1]}">
    </#list>
  </#if>

  <!-- CSS do design v0 -->
  <link href="${url.resourcesPath}/css/login-v0.css" rel="stylesheet" />

  <#if properties.styles?has_content>
    <#list properties.styles?split(" ") as style>
      <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
    </#list>
  </#if>

  <#if properties.scripts?has_content>
    <#list properties.scripts?split(" ") as script>
      <script defer src="${url.resourcesPath}/${script}" type="text/javascript"></script>
    </#list>
  </#if>
</#macro>
