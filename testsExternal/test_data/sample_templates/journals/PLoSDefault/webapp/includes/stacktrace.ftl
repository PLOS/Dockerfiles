<#if Session.ambraproject_isInternalIp?exists && Session.ambraproject_isInternalIp && exceptionStack?exists>
  <br />
  <br />
  <br />
  <div class="collapsibleContainer" title="+&nbsp;Technical Information for Developers">
    <pre>${exceptionStack}</pre>
  </div>
</#if>
