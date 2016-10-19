<#include "/includes/search.ftl">

<div id="nav-main" class="nav">
 <ul>
 <@s.url action="pbioCollections" namespace="/static" includeParams="none" id="browsePBIO"/>
 <@s.url action="pmedCollections" namespace="/static" includeParams="none" id="browsePMED"/>
 <@s.url action="pcbiCollections" namespace="/static" includeParams="none" id="browsePCBI"/>
 <@s.url action="pgenCollections" namespace="/static" includeParams="none" id="browsePGEN"/>
 <@s.url action="ppatCollections" namespace="/static" includeParams="none" id="browsePPAT"/>
 <@s.url action="poneCollections" namespace="/static" includeParams="none" id="browsePONE"/>
 <@s.url action="pntdCollections" namespace="/static" includeParams="none" id="browsePNTD"/>
 <@s.url action="comlCollections" namespace="/static" includeParams="none" id="browseCOML"/>
    <li id="mn-01"><a href="javascript:void(0);">Browse</a>
      <div class="submenu">
        <div class="menu">
          <ul>
            <li><a href="${browsePBIO}">PLOS Biology Collections</a></li>
            <li><a href="${browsePMED}">PLOS Medicine Collections</a></li>
            <li><a href="${browsePCBI}">PLOS Computational Biology Collections</a></li>
            <li><a href="${browsePGEN}">PLOS Genetics Collections</a></li>
            <li><a href="${browsePPAT}">PLOS Pathogens Collections</a></li>
            <li><a href="${browsePONE}">PLOS ONE Collections</a></li>
            <li><a href="${browsePNTD}">PLOS Neglected Tropical Diseases Collections</a></li>
            <li><a href="${browseCOML}">Census of Marine Life Collections</a></li>
          </ul>
        </div>
      </div>
    </li>
  </ul>
</div>