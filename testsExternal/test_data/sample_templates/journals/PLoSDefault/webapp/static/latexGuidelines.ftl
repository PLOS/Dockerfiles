<#--
  $HeadURL:: http://ambraproject.org/svn/plos/templates/head/journals/PLoSDefault/webap#$
  $Id: latexGuidelines.ftl 12936 2012-11-30 21:54:56Z josowski $
  
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
<!-- begin : main content -->


<h1>Author Guidelines for PLOS LaTeX Submissions</h1>

  <p>Thank you for your interest in submitting your work to PLOS.
  This document will help you prepare your LaTeX formatted
  manuscript. Part of the production process includes the use of
  automated utilities to convert your LaTeX manuscript into our
  publishing format. In order for the conversion process to go as
  smoothly as possible, please limit the use of non-standard LaTeX
  packages and formatting.</p>

  <p>This document is not intended to teach authors how to create
  manuscripts using LaTeX. This document does contain information
  on how to best prepare your LaTeX manuscript for PLOS. Use the
  <a href="guidelines">Author Guidelines</a> and
  this document to properly format your manuscript for submission
  to PLOS.</p>

  <p>PLOS does not accept vector EPS figures generated using LaTeX.
  We only accept LaTeX generated figures in TIFF format. Export
  your LaTeX files as PDFs, and then open them in GIMP or Photoshop
  and save as TIFF. In general, Figures must be generated in a
  standalone graphics application such as Adobe Illustrator,
  InkScape, PyMol, MatLab, SAS, etc. Please see our <a href=
  "figureGuidelines">Figure Guidelines</a> for more
  information.</p>

  <h3>Initial Submission</h3>

  <p>Upload the PDF as your Article File, containing your
  manuscript text, references, figure legends and tables. Please do
  not include graphics in your article file; they should be
  uploaded separately.</p>

  <h3>On Acceptance</h3>

  <p>On acceptance, you will be asked to upload your LaTeX source
  files. Please upload your .tex file as your "LaTeX Source file
  (TEX file)." If you have a separate bibliography (.bib or .bbl),
  please upload it as your "LaTeX bibliography (BIB file)." Please
  also update your PDF Article File with the most recent PDF
  version of your article.</p>

  <p><strong>Note:</strong> When a LaTeX paper begins the
  production process, your .tex file will be validated to ensure
  that the integrity of PLOS template has been maintained. This
  validation process helps to reduce conversion errors and the
  length of time it takes to publish the paper. If you have not
  followed the template format, your manuscript may be sent back to
  you for corrections.</p>

  <h2>Manuscript Preparation in LaTeX</h2>

  <h3>LaTeX Version</h3>

  <p>You are required to use LaTeX2e. If you do not have the latest
  version of LaTeX, you can download it from a number of sites
  including <a href=
  "http://www.LaTeX-project.org/">http://www.LaTeX-project.org/</a>.</p>

  <h3>PLOS Provided Files</h3>
<ul>
  <li><a href=
  "plos_template.tex">plos_template.tex</a>:
  For your convenience, PLOS provides a template for LaTeX
  submissions below. Use this template file as an empty framework
  for your submission. Do NOT change or remove elements from the
  template.</li>

  <li><a href=
  "plos2009.bst">plos2009.bst</a>:
  BibTeX style sheet. Use this file to specify the formatting of
  your BibTeX file. This will ensure that your references are
  generated in the correct format.</li>
</ul>

  <h3>LaTeX Formatting Best Practices</h3>

  <p>Below are some "best practices" for preparing your LaTeX
  manuscript. Though it may seem that we are not taking full
  advantage of the extensive abilities of LaTeX, due to current
  Typesetting constraints, we convert your LaTeX file our
  publishing format using a commercial software package. Some of
  the more "creative" (and even several somewhat standard)
  capabilities of LaTeX do not convert well.</p>

  <ul>
    <li>PLOS provides a template file for authors wishing to submit
    their article prepared using LaTeX. Please use this file, and
    only modify the header in the indicated area (denoted by "**
    EDIT HERE **).</li>

    <li>Please use PLOS template for your manuscript. Your
    manuscript will not be accepted into Production unless the
    template is used.</li>

    <li>Do NOT use any other packages than those specified in the
    template. If you use any other packages, your manuscript will
    be returned.</li>

    <li>Please limit the use of macros. The conversion software we
    use often cannot handle even "simple" macros, which then
    increase the chance for errors in the converted document.</li>

    <li>Please ensure to include in the "$" environment all
    portions of an equation, and any superscripts or subscripts
    also include the base number/text. In order to ensure the
    correct rendering of your equations in the XML, anything within
    the "$" environment is rendered as a graphic. To decrease the
    chance for incorrect display in the XML, please include all
    relevant text within the "$" signs.</li>
  </ul>

  <table>
    <tr valign="top">
      <th>
        Entered (Wrong)
      </th>

      <th>
        Displayed in XML
      </th>

      <th>
        Correct
      </th>
    </tr>

    <tr valign="top">
      <td>
        $C_m=1\mu$F/cm$^2$
      </td>

      <td>
        <img src=
        "/images/Manuscript+Preparation+in+LaTeX_html_m1d10daa9.jpg" name=
        "graphics1" align="bottom" border=
        "0">
      </td>

      <td>
        $C_m=1\muF/cm^2$
      </td>
    </tr>

    <tr valign="top">
      <td>
        $\epsilon=0.175\mu$s cm$^{-1}$
      </td>

      <td>
        <img src=
        "/images/Manuscript+Preparation+in+LaTeX_html_38dc115c.jpg" name=
        "graphics2" align="bottom" border=
        "0">
      </td>

      <td>
        $\epsilon=0.175\mu s cm^{-1}$
      </td>
    </tr>

    <tr valign="top">
      <td>
        $n=2$, 3, 5, 7 and 9
      </td>

      <td>
        <img src=
        "/images/Manuscript+Preparation+in+LaTeX_html_m6f4ed2ee.jpg" name=
        "graphics3" align="bottom" border=
        "0">
      </td>

      <td>
        $n=2, 3, 5, 7 and 9$
      </td>
    </tr>
  </table>

  <ul>
    <li>Below are ways to obtain the preferred formatting for the
    converted LaTeX file. While updating your manuscript for this
    formatting may take a bit of time on your part, it will result
    in more visually pleasing PDF and XML versions of your
    article.</li>
  </ul>

  <table>
    <tr valign="top">
      <th>
        Command/Formatting
      </th>

      <th>
        Do NOT use
      </th>

      <th>
        USE
      </th>
    </tr>

    <tr valign="top">
      <td>
        Bolding in the Math environment
      </td>

      <td>
        \bf{}; \boldsymbol
      </td>

      <td>
        \mathbf{}
      </td>
    </tr>

    <tr valign="top">
      <td>
        Roman (unitalicized) text in the Math environment
      </td>

      <td></td>

      <td>
        \mathrm{}
      </td>
    </tr>

    <tr valign="top">
      <td>
        Fractions
      </td>

      <td>
        \over
      </td>

      <td>
        \frac{}{}
      </td>
    </tr>

    <tr valign="top">
      <td>
        Special symbols from the keyboard
      </td>

      <td>
        \usepackage{inputenc}
      </td>

      <td>
        Standard LaTeX commands (e.g., \'{e} for &#233;; \`{e}
        for &#232;, etc.)
      </td>
    </tr>

    <tr valign="top">
      <td>
        Superscripts
      </td>

      <td>
        \textsuperscript
      </td>

      <td>
        $base^{superscript}$
      </td>
    </tr>

    <tr valign="top">
      <td>
        Text italics
      </td>

      <td>
        math mode
      </td>

      <td>
        \emph{} or \textit{}
      </td>
    </tr>

    <tr valign="top">
      <td>
        Fixed-width font
      </td>

      <td>
        \usepackage{listings}
      </td>

      <td>
        \texttt{}
      </td>
    </tr>

    <tr valign="top">
      <td>
        "Fancy" Font (<img src=
        "/images/latex_ff.jpg" name=
        "Object1" align="absmiddle">)
      </td>

      <td></td>

      <td>
        \mathcal{}
      </td>
    </tr>

    <tr valign="top">
      <td>
        "Fancy" Font II (<img src=
        "/images/latex_ff2.jpg" name=
        "Object2" align="absmiddle">)
      </td>

      <td></td>

      <td>
        \mathbb{}
      </td>
    </tr>

    <tr valign="top">
      <td>
        Define shortcuts
      </td>

      <td>
        \def
      </td>

      <td>
        \newcommand
      </td>
    </tr>

    <tr valign="top">
      <td>
        Decreased spacing
      </td>

      <td>
        \hspace{-#}
      </td>

      <td>
        Do not specify spacing that is merely stylistic.
      </td>
    </tr>

    <tr valign="top">
      <td>
        Command Abbreviations
      </td>

      <td>
        Do not use abbreviations (\beq, \ee, etc.)
      </td>

      <td>
        full command names
      </td>
    </tr>
  </table>

  <h3>LaTeX In-Line versus Display Equations</h3>

  <ul>
    <li>Display Equations

      <ul>
        <li>Include entire equation in one math environment</li>

        <li>DO include terminal punctuations within the math
        environment</li>
      </ul>
    </li>

    <li>In-Line Equations

      <ul>
        <li>If any part of the equation or phrase includes a
        character only available in math mode, then include the
        entire equation in one math environment</li>

        <li>Do NOT include punctuation within the math
        environment</li>
      </ul>
    </li>
  </ul>

  <h3>LaTeX Tables</h3>

  <ul>
    <li>Tables must be cell based; do not merge rows.</li>

    <li>Do not use \hline for newlines within a cell. This will
    result in data being split between two different shaded rows.
    Instead, allow text to wrap within a cell.</li>
  </ul>

  <table>
    <tr valign="top">
      <th>
        LaTeX Code
      </th>

      <th>
        Intent
      </th>

      <th>
        Converted Result
      </th>
    </tr>

    <tr valign="top">
      <td>
        \begin{tabular}{|c|c|c|}<br />

        \hline<br />

        Head1 &amp; Head2 &amp; Head3 \\<br />

        Unit1 &amp; Unit 2 &amp; Unit3 \\<br />

        \hline<br />

        Row1 &amp; Row1 &amp; Row1\\<br />

        \hline<br />

        Row2 &amp; Row2 &amp; Row2\\<br />

        \hline<br />

        Row3 &amp; Row3 &amp; Row3\\<br />

        \hline<br />

        Row4 &amp; Row4 &amp; Row4\\<br />

        \hline<br />
      </td>

      <td>
          <img src=
        "/images/latex_intent.jpg" name=
        "graphics1" align="bottom" border=
        "0" />
      </td>

      <td>
      
          <img src=
        "/images/latex_converted.jpg" name=
        "graphics1" align="bottom" border=
        "0" />
      </td>
    </tr>
  </table>

<!-- end : main contents -->