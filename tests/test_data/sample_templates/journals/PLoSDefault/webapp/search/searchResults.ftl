<#import "search_variables.ftl" as search>
<#include "/global/paging_macro.ftl">

<#assign max_authors = 5>
<#assign max_editors = 5>
<#assign max_institutions = 5>

<#assign max_authors_filter = 15>
<#assign max_subjects_filter = 10>
<#assign max_articletypes_filter = 10>

<#assign filterJournalsAsString>
  <#list filterJournals as journalKey>
    ${freemarker_config.getDisplayName(journalKey)}<#if journalKey_has_next> OR </#if>
  </#list>
</#assign>

<#assign filterSubjectsAsString>
  <#list filterSubjects as subject>
    "${subject}"<#if subject_has_next> AND </#if>
  </#list>
</#assign>

<#assign filterArticleTypeAsString>
  <#list filterArticleTypes as articleType>
  "${articleType}"<#if articleType_has_next> OR </#if>
  </#list>
</#assign>

<#--
  This URL is used for both the return link to the Advanced Search form AND the links to other pages of results.
-->
<#if (searchType.length() == 0)>
  ERROR, searchType must be defined.
</#if>


<#macro headerHdrResults >
  <div class="header hdr-results">

    <h2>${totalNoOfResults}
      <#if totalNoOfResults == 1>
        result
      <#else>
        results
      </#if>
      for <span><#if searchType == "simple">${query?html}<#else>${queryAsExecuted?html}</#if></span>
    </h2>

    <div id="search-view">
      <span class="text">View as:</span>
      <span class="figs">figures</span>
      <span class="list">list</span>
    </div>

    <div id="connect" class="nav">
      <ul class="lnk-social cf">
        <li class="lnk-alert ir">
          <#if Session?exists && Session[freemarker_config.userAttributeKey]?exists>
            <a href="#" class="save-search-link" class="save-search" title="Save Search Alert">Alert</a>
          <#else>
            <a href="#" class="login-link" class="save-search" title="Save Search Alert">Alert</a>
          </#if>
        </li>
        <li class="lnk-rss ir">
          <a href="${rssSearchURL}?<@URLParameters parameters=searchParameters />" title="RSS">RSS</a>
        </li>
      </ul>
    </div>

  </div>
</#macro>


<#assign totalPages = ((totalNoOfResults + pageSize - 1) / pageSize)?int>

<form name="searchStripForm" id="searchStripForm" action="${searchURL}" method="get">

  <div id="hdr-search-results">
    <div id="db">
      <@s.hidden name="searchName"/>
      <@s.hidden name="weekly" />
      <@s.hidden name="monthly" />
      <@s.hidden name="startPage"/>
      <@s.hidden name="pageSize" />
      <@s.hidden name="filterKeyword" />
      <@s.hidden name="resultView" value="${resultView!}"/>

      <#if searchType == "simple">
        <fieldset>
          <legend>Search</legend>
          <label for="searchOnResult">Search</label>
          <div class="wrap">
            <input id="searchOnResult" type="text" name="query" value="${query?html}">
            <input type="image" alt="SEARCH" src="/images/icon.search.gif">
          </div>
        </fieldset>
        <a id="advSearch" class="btn primary"
           href="${advancedSearchURL}?filterJournals=${currentJournal}&query=${query?html}&noSearchFlag=set"
           name="advSearch">advanced</a>
      <#else>
        <fieldset>
          <legend>Search</legend>
          <label for="searchOnResult">Search</label>
          <div class="wrap">
            <input id="searchOnResult" type="text" name="unformattedQuery" value="${queryAsExecuted?html}">
            <input type="image" alt="SEARCH" src="/images/icon.search.gif">
          </div>
        </fieldset>
        <a id="advSearch" class="btn primary"
           href="${advancedSearchURL}?<@URLParameters parameters=searchParameters />&noSearchFlag=set" name="advSearch">
          advanced</a>
      </#if>
    </div>

    <#if (totalNoOfResults > 0)>
      <div class="options">
        <span class="clear-filter">
          <a id="clearAllFilters"
             href="${searchURL}?<@URLParameters parameters=searchParameters names="filterKeyword,filterArticleTypes,filterJournals,filterSubjects,filterAuthors,startPage,filterStartDate,filterEndDate" values="" />"
             class="btn primary">Clear all filters</a>
        </span>

        <div class="resultSort">
          <select name="sort" id="sortPicklist">
            <#list sorts as sortItem>
              <#if ((!sort?? || (sort?? && sort == "")) && (sortItem_index == 0))>
                <option selected value="${sortItem}">${sortItem}</option>
              <#else>
                <#if (sort?? && (sort == sortItem))>
                  <option selected value="${sortItem}">${sortItem}</option>
                <#else>
                  <option value="${sortItem}">${sortItem}</option>
                </#if>
              </#if>
            </#list>
          </select>
        </div>
      </div>

      <#if ((filterSubjects?size > 0) || (filterJournals?size > 0) || (filterArticleTypes?size > 0) ||
      (filterAuthors?size > 0) || filterKeyword != "" || filterStartDate??)>
        <div class="filter-block cf">
          <#if (filterStartDate??)>
            <div class="filter-item">
              ${filterStartDate?date?string} TO ${filterEndDate?date?string}&nbsp;
              <img id="clearDateFilter" src="/images/btn.close.png" class="clear-filter" title="Clear content posted filter"
                   alt="Clear content posted filter">
            </div>
          </#if>
          <#if (filterJournals?size > 0)>
            <div class="filter-item">
              ${filterJournalsAsString}&nbsp;
                <img id="clearJournalFilter" src="/images/btn.close.png" class="clear-filter" title="Clear journals filter"
                     alt="Clear journals filter">
            </div>
          </#if>
          <#if (filterSubjects?size > 0)>
            <div class="filter-item">
              Subject areas:
              <#list filterSubjects as subject>"${subject}
                " <#if (subject_index) gt filterSubjects?size - 3><#if subject_has_next>
                and </#if><#else><#if subject_has_next>, </#if></#if></#list>
              &nbsp;<img id="clearSubjectFilter" src="/images/btn.close.png" class="clear-filter" title="Clear topics filter"
                         alt="Clear topics filter">
            </div>
          </#if>
          <#if (filterAuthors?size > 0)>
            <div class="filter-item">
              Authors:
              <#list filterAuthors as author>"${author}" <#if (author_index) gt filterAuthors?size - 3><#if author_has_next>
                and </#if><#else><#if author_has_next>, </#if></#if></#list>
              &nbsp;<img id="clearAuthorFilter" src="/images/btn.close.png" class="clear-filter" title="Clear authors filter"
                         alt="Clear authors filter">
            </div>
          </#if>
          <#if (filterArticleTypes?size > 0)>
            <div class="filter-item">
              Article Type:
              <#list filterArticleTypes as articleType>"${articleType}
                  " <#if (articleType_index) gt filterArticleTypes?size - 3><#if articleType_has_next>
                  or </#if><#else><#if articleType_has_next>, </#if></#if></#list>
                &nbsp;<img id="clearArticleTypesFilter" src="/images/btn.close.png" class="clear-filter" title="Clear article type filter" alt="Clear article type filter">
            </div>
          </#if>
          <#if (filterKeyword != "")>
            <div class="filter-item">
              Searching in: ${filterKeyword}&nbsp;
              <a href="${searchURL}?<@URLParameters parameters=searchParameters names="filterKeyword,startPage" values="" />&from=keywordFilterClearLink">
                <img src="/images/btn.close.png" class="clear-filter" title="Clear searching in filter"
                     alt="Clear searching in filter"></a>
            </div>
          </#if>
        </div>
      </#if>

      <div id="search-facets">
        <div class="menu">
          <div class="item" data-facet="dateFacet">Date</div>
          <div class="item" data-facet="journalFacet">Journals</div>
          <div class="item" data-facet="topicFacet">Subject Areas</div>
          <div class="item" data-facet="authorFacet">Authors</div>
          <div class="item" data-facet="keywordFacet">Where my keywords appear</div>
          <div class="item" data-facet="articleTypeFacet">Article Type</div>
        </div>

        <div id="dateFacet" class="facet">
          <label for="startDateAsStringId">Published between:</label>
          <input type="text" name="filterStartDate" maxlength="10" placeholder="YYYY-MM-DD" id="startDateAsStringId"
            <#if filterStartDate??>value="${filterStartDate?string("yyyy-MM-dd")}"</#if>/>
          <label for="endDateAsStringId">and</label>
          <input type="text" name="filterEndDate" maxlength="10" placeholder="YYYY-MM-DD" id="endDateAsStringId"
            <#if filterEndDate??>value="${filterEndDate?string("yyyy-MM-dd")}"</#if>/>
          <input name="filterDateButton" type="button" class="btn primary" value="apply" title="apply" />
        </div>

        <#if (resultsSinglePage.journalFacet??)>
          <div id="journalFacet" class="facet">
            <dl>
              <dt>Journals</dt>
              <#list resultsSinglePage.journalFacet as f>
                <dd>
                  <label><input type="checkbox" name="filterJournals" value="${f.name}"
                    <#if (filterJournals?seq_contains(f.name)) >
                                checked="true"</#if>> ${freemarker_config.getDisplayName(f.name)}
                    (${f.count})</label>
                </dd>
              </#list>
            </dl>
          </div>
        </#if>

        <#if (resultsSinglePage.subjectFacet??)>
          <div id="topicFacet" class="facet">
            <dl>
              <dt>Topics</dt>
              <#list resultsSinglePage.subjectFacet as f>
                <#if f_index lt max_subjects_filter>
                  <dd>
                    <label><input type="checkbox" name="filterSubjects" value="${f.name}"
                      <#if (filterSubjects?seq_contains(f.name)) > checked="true"</#if>> ${f.name} (${f.count})</label>
                  </dd>
                </#if>
              </#list>
              <#if resultsSinglePage.subjectFacet?size gt max_subjects_filter>
                <dd>
                  <label><span class="view-more">See more...</span></label>
                </dd>
              </#if>
            </dl>

            <dl class="more">
              <dt>More Topics</dt>
              <#list resultsSinglePage.subjectFacet as f>
                <#if f_index gte max_subjects_filter>
                  <dd>
                    <label><input type="checkbox" name="filterSubjects" value="${f.name}"
                      <#if (filterSubjects?seq_contains(f.name)) > checked="true"</#if>> ${f.name} (${f.count})</label>
                  </dd>
                </#if>
              </#list>
              <dd>
                <label><a href="#hdr-search-results" class="view-less">See less...</a></label>
              </dd>
            </dl>
          </div>
        </#if>

        <#if (resultsSinglePage.keywordFacet??)>
          <div id="keywordFacet" class="facet">
            <dl>
              <dt>Where my keywords appear</dt>
              <#list resultsSinglePage.keywordFacet as f>
                <dd>
                  <a href="${searchURL}?<@URLParameters parameters=searchParameters names="filterKeyword,startPage" values=[f.name, 0] />&from=keywordFilterLink">${f.name}
                    (${f.count})</a>
                </dd>
              </#list>
            </dl>
          </div>
        </#if>

        <#if (resultsSinglePage.articleTypeFacet??)>
          <div id="articleTypeFacet" class="facet">
            <dl>
              <dt>Article Type</dt>
              <#list resultsSinglePage.articleTypeFacet as f>
                <#if f_index lt max_articletypes_filter>
                  <dd>
                    <label><input type="checkbox" name="filterArticleTypes" value="${f.name}"
                      <#if (filterArticleTypes?seq_contains(f.name)) > checked="true"</#if>> ${f.name} (${f.count})</label>
                  </dd>
                </#if>
              </#list>
              <#if resultsSinglePage.articleTypeFacet?size gt max_articletypes_filter>
                <dd>
                  <label><span class="view-more">See more...</span></label>
                </dd>
              </#if>
            </dl>

            <dl class="more">
              <dt>More Article Types</dt>
              <#list resultsSinglePage.articleTypeFacet as f>
                <#if f_index gte max_articletypes_filter>
                  <dd>
                    <a href="${searchURL}?<@URLParameters parameters=searchParameters names="filterArticleTypes,startPage" values=[f.name, 0] />&from=articleTypeFilterLink">${f.name}
                      (${f.count})</a>
                  </dd>
                </#if>
              </#list>
              <dd>
                <label><a href="#hdr-search-results" class="view-less">See less...</a></label>
              </dd>
            </dl>

          </div>
        </#if>

        <#if (resultsSinglePage.authorFacet??)>
          <div id="authorFacet" class="facet">

            <dl>
              <dt>Authors</dt>
              <#list resultsSinglePage.authorFacet as f>
                <#if f_index lt max_authors_filter>
                  <dd>
                    <label><input type="checkbox" name="filterAuthors" value="${f.name}"
                      <#if (filterAuthors?seq_contains(f.name)) > checked="true"</#if>> ${f.name}
                      (${f.count})</label>
                  </dd>
                </#if>
              </#list>
              <#if resultsSinglePage.authorFacet?size gt max_authors_filter>
                <dd>
                  <label><span class="view-more">See more...</span></label>
                </dd>
              </#if>
            </dl>

            <dl class="more">
              <dt>More Authors</dt>
              <#list resultsSinglePage.authorFacet as f>
                <#if f_index gte max_authors_filter>
                  <dd>
                    <label><input type="checkbox" name="filterAuthors" value="${f.name}"
                      <#if (filterAuthors?seq_contains(f.name)) > checked="true"</#if>> ${f.name} (${f.count})</label>
                  </dd>
                </#if>
              </#list>
              <dd>
                <label><a href="#hdr-search-results" class="view-less">See less...</a></label>
              </dd>
            </dl>

          </div>
        </#if>
      </div>
    </#if>
  </div><#-- hdr-fig-search -->
</form>

<div id="pagebdy-wrap" class="bg-dk">
  <div id="pagebdy">

    <#if (fieldErrors?? && numFieldErrors > 0)>
      <div class="error">
        <br/>
        <br/>

        <h1>There was a problem with your search.</h1>
        <#list fieldErrors?keys as key>
          <#list fieldErrors[key] as errorMessage>
            <h4>${errorMessage}</h4>
          </#list>
        </#list>

        <h4>Please enter different terms
          or try our <a href="${advancedSearchURL}">advanced search</a>.</h4>
      </div>
    <#else>
      <#if ((totalNoOfResults == 0))>
        <div id="static-wrap" class="cf">
          <#if ((filterSubjects?size > 0) || (filterJournals?size > 0) || (filterArticleTypes?size > 0))>
            <p class="search-result">You searched for articles that have all of the following:</p>

            <p class="search-result">Search Term(s): <strong>"${queryAsExecuted?html}"</strong></p>
          </#if>
          <#if (filterStartDate??)>
            <p class="search-result">Publication Date: <b>${filterStartDate?date?string} TO ${filterEndDate?date?string}&nbsp;</b></p>
          </#if>
          <#if (filterAuthors?size > 0)>
            <p class="search-result">Author(s):
              <b><#list filterAuthors as author>"${author}"
                <#if (author_index) gt filterAuthors?size - 3><#if author_has_next>
                  and </#if><#else><#if author_has_next>, </#if></#if></#list></b>
            </p>
          </#if>
          <#if (filterSubjects?size > 0)>
            <p class="search-result">Subject categories:
              <b><#list filterSubjects as subject>"${subject}"
                <#if (subject_index) gt filterSubjects?size - 3><#if subject_has_next>
                  and </#if><#else><#if subject_has_next>, </#if></#if></#list></b>
            </p>
          </#if>
          <#if (filterJournals?size > 0)>
            <p class="search-result">Journal(s):
              <b><#list filterJournals as journal>"${freemarker_config.getDisplayName(journal)}"
                <#if (journal_index) gt filterJournals?size - 3><#if journal_has_next>
                  and </#if><#else><#if journal_has_next>, </#if></#if></#list></b>
            </p>
          </#if>
          <#if (filterArticleTypes?size > 0)>
            <p class="search-result">Article Type:
              <b><#list filterArticleTypes as articleType>"${articleType}"
                <#if (articleType_index) gt filterArticleTypes?size - 3><#if articleType_has_next>
                  and </#if><#else><#if articleType_has_next>, </#if></#if></#list></b>
            </p>
          </#if>
          <p class="search-result">There were no results, please
            <a href="${advancedSearchURL}?<@URLParameters parameters=searchParameters />&noSearchFlag=set">
              refine your search</a> and try again.</p>
        </div>
      <#else>
        <#if (resultView?? && resultView == "fig")>
          <#assign searchResultsBlockStyle="display: none;">
          <#assign figSearchBlockStyle="">
        <#else>
          <#assign searchResultsBlockStyle="">
          <#assign figSearchBlockStyle="display: none;">
        </#if>

        <#--list search result block-->

        <div id="search-results-block" class="cf" style="${searchResultsBlockStyle}">

          <@headerHdrResults />

          <div class="main">

            <ul id="search-results">
              <#list searchResults as hit>
                <@s.url id="fetchArticleMetricsURL" action="fetchArticleMetrics" namespace="/article" articleURI="info:doi/${hit.uri}" includeParams="none"/>
                <li data-doi="${hit.uri}" data-pdate="${hit.date.getTime()?string.computer}" data-metricsurl="${fetchArticleMetricsURL}">
                  <span class="article">
                    <@s.url id="fetchArticleURL" action="fetchArticle" namespace="/article" articleURI="info:doi/${hit.uri}" includeParams="none"/>
                    <@s.a href="${(freemarker_config.getJournalUrlFromIssn(hit.issn))!(freemarker_config.doiResolverURL)}%{fetchArticleURL}" title="Read Open-Access Article"><@articleFormat>${hit.title}</@articleFormat></@s.a>
                  </span>
                  <span class="authors">${hit.creator!""}</span>

                  <#if hit.articleTypeForDisplay??>
                    ${hit.articleTypeForDisplay} |
                  </#if>
                  <#if hit.date??>
                    published ${hit.date?string("dd MMM yyyy")} |
                  </#if>
                  <#if hit.issn??>
                    ${freemarker_config.getDisplayNameByEissn(hit.issn)}
                  </#if>
                  <#if hit.uri??>
                    <span class="uri">${hit.uri?replace("info:doi/", "doi:")}</span>
                  </#if>
                  <#if (hit.retraction?? && hit.retraction?length gt 0)  ||
                  (hit.expressionOfConcern?? && hit.expressionOfConcern?size gt 0)>
                    <div class="eoc-ret-searchHit">
                      <div><span></span></div>
                      <div>
                        <#if hit.retraction?? && hit.retraction?length gt 0>
                          <a target="_blank" href= ${"\"" + freemarker_config.getJournalUrlFromIssn(hit.issn) + "/article/info:doi/" + hit.retraction?url + "\""}>This article has been retracted.</a>
                        <#else>
                          <!-- the most recent eoc -->
                          <a target="_blank" href= ${"\"" + freemarker_config.getJournalUrlFromIssn(hit.issn) + "/article/info:doi/" + hit.expressionOfConcern?first?url + "\""}>View Expression of Concern</a>
                        </#if>
                      </div>
                    </div>
                  </#if>
                  <span class="metrics"><span>Loading metrics information...</span></span>
                </li>
              </#list>
            </ul>

            <div>
              <@renderSearchPaginationLinks searchURL totalPages startPage/>
              <#if (totalPages gt 1 )>
                <div class="pageSize">
                  Results per page
                  <select name="pageSize" id="pageSizePicklist">
                    <#if ( ! pageSize?? ) || (pageSize?length lt 1)>
                      <#assign pageSize = 12>
                    </#if>
                    <#list pageSizes as size>
                      <#if (size == pageSize?string)>
                        <option value="${size}" selected="selected">${size}</option>
                      <#else>
                        <option value="${size}">${size}</option>
                      </#if>
                    </#list>
                  </select>
                </div>
              </#if>
            </div>
          </div><!--main-->

          <div class="sidebar">

            <div class="block blk-style-a blk-search-history">
              <div class="header">
                <h3>Search History</h3>
              </div>
              <div class="body">
                <#assign recentSearchDisplayTextMaxLength = 28>
                <#if recentSearches?? && recentSearches?size gt 0>
                  <dl id="recentSearches" class="facet">
                    <#list recentSearches?keys?reverse as key>
                      <#if key?length gt recentSearchDisplayTextMaxLength>
                        <dd><a href="${recentSearches[key]}"
                               title="${key}">${key?substring(0,recentSearchDisplayTextMaxLength-2)}...</a></dd>
                      <#else>
                        <dd><a href="${recentSearches[key]}" title="${key}">${key}</a></dd>
                      </#if>
                    </#list>
                  </dl>
                </#if>
              </div>
            </div>

            <#-- This block for Phase 2 development -->
            <div class="block blk-style-a blk-related-collections">
              <div class="header">
                <h3>Related</h3>
              </div>
                <!-- This value is populated when the user clicks on author/editor save search button.-->
                <input type="hidden" id="saveSearchFacetVal"  name="saveSearchFacetVal">
                <div class="body">
                <#if ((totalNoOfResults gt 0) && (fieldErrors?size == 0))>
                  <#if (resultsSinglePage.authorFacet??)>
                    <h4>Authors</h4>
                    <ul class="actions">
                      <#list resultsSinglePage.authorFacet as f>
                        <#if f_index < max_authors>
                          <li>
                            <a href="${advancedSearchURL}?unformattedQuery=author%3A%22${f.name?url}%22&from=authorLink&sort=${sorts[0]?url}">${f.name}</a>
                            <span class="icons">
                              <a href="${rssSearchURL}?unformattedQuery=author%3A%22${f.name?url}%22&from=authorLink&sort=${sorts[0]?url}">
                                <img src="/images/icon.rss.16.png" width="16" height="17" alt="RSS" title="RSS">
                              </a>
                              <#if Session?exists && Session[freemarker_config.userAttributeKey]?exists>
                                <a href="#" class="save-search-link" class="save-search" name='author:"${f.name}"' onclick="setFacetSearchValue(this.id); return false;">
                                  <img src="/images/icon.alert.16.png" width="16" height="17" alt="Save Search Alert" title="Save Search Alert">
                                </a>
                              <#else>
                                <a href="#" class="login-link" class="save-search" title="Save Search Alert" >
                                  <img src="/images/icon.alert.16.png" width="16" height="17" alt="Save Search Alert" title="Save Search Alert">
                                </a>
                              </#if>
                            </span>
                          </li>
                        </#if>
                      </#list>
                    </ul>
                  </#if>

                  <#if (resultsSinglePage.editorFacet??)>
                    <h4>Editors</h4>
                    <ul class="actions">
                      <#list resultsSinglePage.editorFacet as f>
                        <#if f_index < max_editors>
                          <li>
                            <a href="${advancedSearchURL}?unformattedQuery=editor%3A%22${f.name?url}%22&from=editorLink&sort=${sorts[0]?url}">${f.name}</a>
                            <span class="icons">
                              <a href="${rssSearchURL}?unformattedQuery=editor%3A%22${f.name?url}%22&from=editorLink&sort=${sorts[0]?url}"><img
                                src="/images/icon.rss.16.png" width="16" height="17" alt="RSS" title="RSS">
                              </a>
                              <#if Session?exists && Session[freemarker_config.userAttributeKey]?exists>
                                <a href="#" class="save-search-link" class="save-search"  name='editor:"${f.name}"' onclick="setFacetSearchValue('editor%3A%22${f.name}%22'); return false;">
                                  <img src="/images/icon.alert.16.png" width="16" height="17" alt="Save Search Alert"title="Save Search Alert">
                                </a>
                              <#else>
                                <a href="#" class="login-link" class="save-search" title="Save Search Alert" >
                                  <img src="/images/icon.alert.16.png" width="16" height="17" alt="Save Search Alert" title="Save Search Alert">
                                </a>
                              </#if>
                            </span>
                          </li>
                        </#if>
                      </#list>
                    </ul>
                  </#if>

                  <#if (resultsSinglePage.institutionFacet??)>
                    <h4>Institutions:</h4>
                    <#list resultsSinglePage.institutionFacet as f>
                      <#if f_index < max_institutions>
                        <p>
                          <a href="${advancedSearchURL}?unformattedQuery=affiliate%3A%22${f.name?url}%22&from=institutionLink&sort=${sorts[0]?url}">${f.name}</a>
                        </p>
                      </#if>
                    </#list>
                  </#if>
                </#if>
              </div><!--body-->
            </div><!--block blk-style-a blk-related-collections-->
          </div><!--sidebar-->
        </div><!--search-results-block-->


        <#--figure search result block-->
        <div id="fig-search-block" class="cf" style="${figSearchBlockStyle}">

          <@headerHdrResults />

          <div id="fig-search-results-wrap">
            <ul id="fig-search-results">
              <#list searchResults as hit>
                <@s.url id="fetchArticleURL" action="fetchArticle" namespace="/article" articleURI="info:doi/${hit.uri}" includeParams="none"/>
                <@s.url id="fetchArticlePDFURL" action="fetchObject" namespace="/article" uri="info:doi/${hit.uri}" representation="PDF" />

                <li data-doi="${hit.uri}" data-pdate="${hit.date.getTime()?string.computer}">
                  <div class="figure">
                    <#if (hit.strikingImage?? && hit.strikingImage?length > 0) >
                      <@s.url id="fetchStrikingImgURL" action="fetchObject" namespace="/article" uri="${hit.strikingImage}" representation="PNG_I" />
                      <img fakesrc="${fetchStrikingImgURL}" alt="">
                    <#else>
                      <img fakesrc="/images/generic_striking_img.png" width="320" height="208" alt="">
                    </#if>
                    <#if (hit.retraction?? && hit.retraction?length gt 0)  ||
                    (hit.expressionOfConcern?? && hit.expressionOfConcern?size gt 0)>
                      <div class="eoc-ret-searchHit eoc-ret-searchHit-fig">
                        <div><span></span></div>
                        <div>
                          <#if hit.retraction?? && hit.retraction?length gt 0>
                            <a target="_blank" href= ${"\"" + freemarker_config.getJournalUrlFromIssn(hit.issn) + "/article/info:doi/" + hit.retraction?url + "\""}>This article has been retracted.</a>
                          <#else>
                            <!-- Most recent eoc-->
                            <a target="_blank" href= ${"\"" + freemarker_config.getJournalUrlFromIssn(hit.issn) + "/article/info:doi/" +  hit.expressionOfConcern?first?url + "\""}>View Expression of Concern</a>
                          </#if>
                        </div>
                      </div>
                    </#if>
                  </div>
                  <ul class="view">
                    <#if (hit.hasAssets == true) >
                      <li><a data-doi="info:doi/${hit.uri}" class="figures">Figures</a></li>
                    <#else>
                      <li><span class="disabled">Figures</span></li>
                    </#if>
                    <#if hit.abstract?? && hit.abstract?length gt 0>
                      <#-- TODO: Abstract is in the search results, we should be able to pass it through to the js -->
                      <li><a data-doi="info:doi/${hit.uri}" class="abstract">Abstract</a></li>
                    <#else>
                      <li><span class="disabled">Abstract</span></li>
                    </#if>
                    <li><@s.a href="${(freemarker_config.getJournalUrlFromIssn(hit.issn))!(freemarker_config.doiResolverURL)}%{fetchArticleURL}" >
                      Full Text</@s.a></li>
                    <li><@s.a href="${(freemarker_config.getJournalUrlFromIssn(hit.issn))!(freemarker_config.doiResolverURL)}%{fetchArticlePDFURL}" target="_blank">
                      Download PDF</@s.a></li>
                  </ul>

                  <div class="body">
                    <span class="date"><#if hit.date??>${hit.date?string("dd MMM yyyy")}</#if></span>

                    <div class="article-kicker"><#if hit.articleTypeForDisplay??>${hit.articleTypeForDisplay}</#if></div>
                      <span class="article">
                        <@s.a href="${(freemarker_config.getJournalUrlFromIssn(hit.issn))!(freemarker_config.doiResolverURL)}%{fetchArticleURL}" title="Read Open-Access Article">
                          <@articleFormat>${hit.truncatedTitle}</@articleFormat>
                        </@s.a>
                      </span>
                      <span class="authors">
                        <#if (hit.creator?length > 100) >
                        ${hit.creator?substring(0, 100)}...
                        <#else>
                        ${hit.creator}
                        </#if>
                      </span>
                    </div>
                  <span class="metrics"><span>Loading metrics information...</span></span>
                </li>
              </#list>
            </ul>
          </div>

          <div>
            <@renderSearchPaginationLinks searchURL totalPages startPage/>
            <#if (totalPages gt 1 )>
              <div class="pageSize">
                Results per page
                <select name="pageSize" id="pageSizePicklistFig">
                  <#if ( ! pageSize?? ) || (pageSize?length lt 1)>
                    <#assign pageSize = 12>
                  </#if>
                  <#list pageSizes as size>
                    <#if (size == pageSize?string)>
                      <option value="${size}" selected="selected">${size}</option>
                    <#else>
                      <option value="${size}">${size}</option>
                    </#if>
                  </#list>
                </select>
              </div>
            </#if>
          </div>
        </div><!--fig-search-block-->

      </#if>
    </#if>
  </div><#-- pagebdy -->
</div><#-- pagebdy-wrap -->

<div id="save-search-box" class="inlinePopup">
  <#include "savedSearchPopup.ftl"/>
</div>

<div id="login-box" class="login inlinePopup">
  <#include "loginSavedSearchPopup.ftl"/>
</div>