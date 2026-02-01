<#macro kw variant="dark">
  <div class="blockchain-logo">
    <svg width="44" height="44" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
      <#if variant == "light">
        <path d="M24 4L42 14V34L24 44L6 34V14L24 4Z" stroke="#ffffff" stroke-width="2" fill="none" />
        <path d="M24 4L24 24M24 24L6 14M24 24L42 14M24 24L24 44" stroke="#ffffff" stroke-width="2" />
        <path d="M15 19L24 24L33 19" stroke="#ffffff" stroke-width="1.5" stroke-opacity="0.4" />
        <path d="M24 24V34" stroke="#ffffff" stroke-width="1.5" stroke-opacity="0.4" />
      <#else>
        <path d="M24 4L42 14V34L24 44L6 34V14L24 4Z" stroke="#1e3a5f" stroke-width="2" fill="none" />
        <path d="M24 4L24 24M24 24L6 14M24 24L42 14M24 24L24 44" stroke="#1e3a5f" stroke-width="2" />
        <path d="M15 19L24 24L33 19" stroke="#1e3a5f" stroke-width="1.5" stroke-opacity="0.4" />
        <path d="M24 24V34" stroke="#1e3a5f" stroke-width="1.5" stroke-opacity="0.4" />
      </#if>
    </svg>
    <div class="blockchain-logo-text">
      <span class="blockchain-logo-title">ABA</span>
      <span class="blockchain-logo-subtitle">Blockchain</span>
    </div>
  </div>
</#macro>
