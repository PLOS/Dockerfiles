<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSDefault/webap#$
  $Id: searchHelp.ftl 15116 2013-06-14 05:35:45Z mbaehr $
  
  Copyright (c) 2007-2010 by Public Library of Science
  http://plos.org
  http://ambraproject.org
  
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
  
  http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<#-- begin : main content -->
<h1>Search Tips</h1>
<p>
    <h2>Quick Tips for Advanced Search</h2>
    <ol>
        <li>Choose a field to search from the picklist.</li>
        <li>Enter search term(s).</li>
        <li>Click the AND OR or NOT buttons to add terms to the search box.</li>
        <li>Repeat steps as necessary.</li>
        <li>Select journals and/or subject categories below, if desired.</li>
        <li>Click Search to run your query, or click Preview to see the result count of your query in the Search History section.</li>

    </ol>

</p>
<hr> </hr>

<p>Please use the following tips to search on PLOS journal websites. </p>
<p>Jump to Topic:</p>
<ul>
    <li><a href="#general">General</a></li>
    <li><a href="#simplesearch">Simple Search</a></li>
    <li><a href="#advancedsearch">Advanced Search</a></li>
    <li><a href="#authorname">Searching by Author Name</a></li>
    <li><a href="#stemming">Stemming</a></li>
    <li><a href="#wildcards">Wildcards</a></li>
    <li><a href="#fuzzy">Fuzzy Searches</a></li>
    <li><a href="#boolean">Boolean Operators</a></li>
</ul>

<h2><a name="general"></a>General</h2>

  <p>Searches can be performed using the Simple Search field at the top of PLOS journal web-pages or using the Advanced Search form. Simple Search provides a quick mechanism for performing searches on author names, words in article titles and words in the article body. Advanced Search is useful for searching on multiple fields and filtering results by Journal, Subject Category and Article Type. 
  <p>Searches can be performed on Single Terms and Phrases. A Single Term is a single word such as <strong>global</strong> or <strong>climate</strong>. A Phrase is a group of words such as <strong>global warming</strong>. Single Terms and Phrases can be entered in both the Simple Search field and Advanced Search form. Phrases in the Advanced form must be entered as Single Terms joined by an OR. For example, to search for <strong>global warming</strong> enter <strong>global</strong> in the text box and click AND. Then type <strong>warming</strong> and click OR then click on Search.</strong></p>

  <p>Searches are not case-sensitive. A search on <strong>GENOME</strong> and <strong>genome</strong> will return the same search results. The minimum word length is three (3) characters. Words shorter than three characters are ignored except in author name searches.

<h2><a name="simplesearch"></a>Simple Search</h2>

  <p>To perform a simple search, enter your search in the Simple Search field at the top of PLOS journal web-pages and click on <strong>Go</strong>. Your search results will appear with a text field at the top of the web-page with your existing search query. You can edit this to submit a new search. This text field submits a Simple Search, just like the Simple Search field at the top of PLOS journal web-pages. Note that <a href="#stemming">stemming</a> is used in Simple Search in lieu of wildcards.</p>

<h2><a name="advancedsearch"></a>Advanced Search</h2>

  <p>The only way to perform an Advanced Search is from the Advanced Search form. The Advanced Search form allows you to create specific search queries based on your criteria. <a href="#wildcards">Wildcards</a> and <a href="#fuzzy">Fuzzy Searches</a> can be used in any field on the Advanced Search form.</p>

  <p>To search for multiple authors, use the Drop down box and select <strong>Author</strong> then type the Author's name in the text box. Choose AND to add the author to your query. To remove an author field, click in the query box to edit your query. In advanced search you can build complex queries using a combination of fields in the drop down box and the boolean operators AND, OR, NOT</p>

<h2><a name="authorname"></a>Searching by Author Name</h2>

  <p>To search for an author in Simple Search, enter the author's given name, surname, or exact name. For example, to search for documents with the author "Patrick O. Brown", you can enter <strong>Patrick</strong> or <strong>Brown</strong> or <strong>Patrick Brown</strong> or <strong>Patrick O. Brown</strong>.</p>

  <p>In Advanced Search, searching on the Author field will return exact results e.g. a search for <strong>Patrick Brown</strong> will only return <strong>Patrick Brown</strong>.</p>

  <p>To search for an author name with an accented character, enter either the accented or non-accented version of the author name. For example, a search on <strong>Ralph Muller</strong> will return <strong>Ralph Muller</strong>, <strong>Ralph M&#252;ller</strong> and <strong>Ralph M&#250;ller</strong>.</p>

  <p>All punctuation marks and character case in author name searches are ignored. A search on <strong>Patrizia d'Amelio</strong> will return <strong>Patrizia D Amelio</strong>, <strong>Patrizia D. Amelio</strong> and <strong>Patrizia D'Amelio</strong>.</p>


<h2><a name="stemming"></a>Stemming</h2>

  <p>For most English words, searches are performed on the stem of a search term. For example, a search on <strong>genome</strong> will also match <strong>genomes</strong>, <strong>genomic</strong>, and <strong>genomics</strong>. Stemming uses a standard dictionary which does not include many specialized terms found in our scientific content. Stemming is supported in both Simple & Advanced search.</p>
    
<h2><a name="wildcards"></a>Wildcards</h2>

    <p>The following characters have special meanings to the query engine</p>
    <p> : ! & " ' ^ + - | ( ) [ ] { } \</p>
    <p>Therefore, all of these characters will be "escaped" by preceding each one with a backslash character</p>
    <p>The wildcard characters ? and * are not escaped</p>

    <p>Advanced Search supports single and multiple character wildcard searches within single terms.</p>

    <p>The single character wildcard (<strong>&#63;</strong>) search looks for terms that match that the search term with the <em>single character</em> replaced. For example:

    <blockquote>
        <p>
            <strong>te&#63;t</strong> will return <strong>text</strong>, <strong>test</strong>, <strong>tent</strong>, etc.
        </p>
    </blockquote>
    

    <p>Right truncation involves placing the wildcard on the right-hand-side of the search string. For example:</p>

    <blockquote>
        <p>
            <strong>clea&#63;</strong> will return <strong>clear</strong>, <strong>clean</strong>, <strong>cleat</strong>, etc.
        </p>
    </blockquote>

    <p>This wildcard can be used multiple times within the same string:</p>

    <blockquote>
        <p>
            <strong>ra&#63;n&#63;</strong> will return <strong>rains</strong>, <strong>rainy</strong>, etc.
        </p>
    </blockquote>

    <p>The multiple character wildcard (<strong>*</strong>) search looks for <em>0 or more characters</em>. Right truncation involves placing the wildcard on the right-hand-side of the search string. For example:</p>

    <blockquote>
        <p>
            <strong>radio*</strong> will return <strong>radio</strong>, <strong>radiometer</strong>, <strong>radiometric</strong>, <strong>radiosonde</strong>, etc.
        </p>
    </blockquote>

    <p>Left truncation involves placing the wildcard on the left-hand-side of the search string. For example: </p>

    <blockquote>
        <p>
            <strong>*ryotic</strong> will return <strong>embryotic</strong>, <strong>eukaryotic</strong>, etc.
        </p>
    </blockquote>

<h2><a name="fuzzy"></a>Fuzzy Searches</h2>

    <p>Advanced Search supports fuzzy searches based on the <a href="http://en.wikipedia.org/wiki/Levenshtein_distance">Levenshtein Distance</a>, or Edit Distance algorithm. To do a fuzzy search use the tilde symbol ("&#126;") at the end of a Single word Term. For example, to search for a term similar in spelling to <strong>roam</strong> use the fuzzy search: </p>

    <blockquote>
        <p>
        <strong>roam&#126;</strong> will return terms like <strong>foam</strong> and <strong>roams</strong>.
        </p>
    </blockquote>

<h2><a name="boolean"></a>Boolean Operators</h2>

    <p>Boolean operators <strong>AND</strong>, <strong>OR</strong>, <strong>NOT</strong> are part of the query builder in Advanced Search. <p>

<#-- end : main contents -->
