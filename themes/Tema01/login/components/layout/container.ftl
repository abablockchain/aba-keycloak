<#macro kw>
  <div class=" min-h-screen sm:py-16 flex items-center justify-center items-center" style="background-image: url(${url.resourcesPath}/dist/img/background_2.png);background-size: cover;">
    <div class="w-fit flex justify-center items-center w-full p-5 relative mx-auto my-auto rounded-xl shadow-lg bg-white" style="width: auto;padding: 49px;">
      <div class="items-center justify-center flex space-between" style="position: relative;display: flex;height: 100%;">
      <div class="space-y-6 w-full ">
       <#nested>
      </div>
      </div>
  </div>
</div>
</#macro>
