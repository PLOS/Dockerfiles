<div id="pagebdy-wrap">
  <div id="pagebdy">

    <div class="layout-625_300 cf">
      <div class="col-1">

        <div id="collections">

          <div class="promoted-block">
            <div class="promoted cf">
              <h2 class="type"><center>Featured Collection</center></h2>
              <div class="img">
                <@s.url action="issue" namespace="/article/browse" includeParams="none" issue="info:doi/10.1371/issue.pcol.v01.i18" id="featured"/>
                <a href="${featured}" title="Read Open-Access Article">
                <img style="float: right; padding: 0px 0px 0px 30px;" src="/images/ReportingGuidelines.jpg"
      alt="collection image" align="right" width="225" height="225"/></a>  
               </div>
              <div class="txt">
                <h3><a href="${featured}" title="Read Open-Access Article">Reporting Guidelines Collection</a></h3>
                <p>Reporting guidelines are statements intended to advise authors on how to report their research and results, helping them to give a clear and transparent account of their work.


</p>
<p>This new Collection draws together editorials, commentary and related research, and highlights some of the many resources in PLOS journals which facilitate the rigorous reporting of scientific studies.
</p>

</p>
              </div>
            </div>
          </div>

          <div class="static-links">
            <h2>All Collections</h2>

            <#-- Variables for Cross-Journal collection TOCs -->
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i01" id="plos1"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i02" id="plos2"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i03" id="plos3"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i04" id="plos4"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i05" id="plos5"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i06" id="plos6"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i07" id="plos7"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i08" id="plos8"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i09" id="plos9"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i10" id="plos10"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i11" id="plos11"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i06" id="pone6"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i12" id="plos12"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i13" id="plos13"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i14" id="plos14"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i15" id="plos15"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i16" id="plos16"/>
             <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i17" id="plos17"/>
             <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i18" id="plos18"/>

            <#-- Variables for Bio collection TOCs -->
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v06.i01" id="pbio1"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v06.i02" id="pbio2"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i04" id="pone4"/>
            <h3 class="replaced" id="pbio">
              <a href="/static/pbioCollections">
                <span><em>PLOS Biology</em> Collections</span>
              </a>
            </h3>
            <ul>
            <li><@s.a href="${plos18}">Reporting Guidelines Collection</@s.a>*</li>
            <li><@s.a href="${plos17}">Ecological Impacts of Climate Change</@s.a>*</li>
            	<li><@s.a href="${plos14}">Text Mining</@s.a>*</li>
              <li><@s.a href="${plos10}">Open Access Collection</@s.a>*</li>
              <li><@s.a href="${plos7}">Epigenetics 2010</@s.a>*</li>
              <li><@s.a href="${pone6}">Biogeography of Deep-Water Chemosynthetic Ecosystems - The ChEss Collection</@s.a>*</li>
              <li><@s.a href="${plos6}">Diversity in the Nearshore: The NaGISA Collection</@s.a>*</li>
              <li><@s.a href="${plos5}">The POST Collection</@s.a>*</li>
              <li><@s.a href="${pone4}">Structural Biology and Human Health: Medically Relevant Proteins from the SGC</@s.a>*</li>
              <li><@s.a href="${plos3}">The TOPP Collection</@s.a>*</li>
              <li><@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>*</li>
              <li><@s.a href="${plos2}">Poverty Collection</@s.a>*</li>
              <li><@s.a href="${pbio1}">Challenges Collection</@s.a></li>
              <li><@s.a href="${pbio2}">Oceanic Metagenomics Collection</@s.a></li>
            </ul>
            </br>

            <#-- Variables for Med collection TOCs -->
            <#-- Add variables here -->
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i01" id="pmed1"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i02" id="pmed2"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i03" id="pmed3"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i04" id="pmed4"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i05" id="pmed5"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i06" id="pmed6"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i07" id="pmed7"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i08" id="pmed8"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i09" id="pmed9"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i10" id="pmed10"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i11" id="pmed11"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i12" id="pmed12"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i13" id="pmed13"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i14" id="pmed14"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i15" id="pmed15"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i16" id="pmed16"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i17" id="pmed17"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i18" id="pmed18"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i19" id="pmed19"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i20" id="pmed20"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i21" id="pmed21"/>
            
            <h3 class="replaced" id="pmed">
              <a href="/static/pmedCollections"><span><em>PLOS Medicine</em> Collections</span></a>
            </h3>
            <ul>
             <li><@s.a href="${plos18}">Reporting Guidelines Collection</@s.a>*</li>
               <li><@s.a href="${pmed21}">The Global Challenges of Noncommunicable Diseases</@s.a></li>
              <li><@s.a href="${plos16}">Measuring Coverage in Maternal, Newborn, and Child Health</@s.a>*</li>
            <li><@s.a href="${pmed20}">Maternal Health Task Force Year 2 Collection (2012-13)</@s.a>*</li>
              <li><@s.a href="${pmed19}">Child Mortality Estimation Methods</@s.a></li>
              <li><@s.a href="${pmed18}">Investigating the Impact of Treatment on New HIV Infections</@s.a></li>
              <li><@s.a href="${pmed17}"><em>PLOS Medicine</em> Series on Big Food</@s.a></li>
              <li><@s.a href="${plos10}">Open Access Collection</@s.a>*</li>
              <li><@s.a href="${plos11}">Voluntary Medical Male Circumcision for HIV Prevention: The Cost, Impact, and Challenges of Accelerated Scale-Up in Southern and Eastern Africa</@s.a>*</li>
              <li><a href="static/maternalhealth">Maternal Health Task Force (MHTF)-PLOS Collection on Maternal Health</a></li>
              <li><@s.a href="${pmed15}">Ghostwriting Collection</@s.a></li>
              <li><@s.a href="${pmed14}">Migration & Health Collection</@s.a></li>
              <li><@s.a href="${plos9}">World Health Report 2012: No Health Without Research</@s.a>*</li>
              <li><@s.a href="${pmed13}">malERA - a research agenda for malaria eradication</@s.a></li>
              <li><@s.a href="${pmed12}">Global Health Estimates</@s.a></li>
              <li><@s.a href="${pmed11}">Water and Sanitation</@s.a></li>
              <li><@s.a href="${plos7}">Epigenetics 2010</@s.a>*</li>
              <li><@s.a href="${pmed10}">Are Drugs Companies Living Up to Their Human Rights Responsibilities? Three Viewpoints</@s.a></li>
              <li><@s.a href="${pmed9}">Sub-Saharan Africa's Mothers, Newborns, and Children</@s.a></li>
              <li><@s.a href="${pmed8}">Evaluating eHealth Collection</@s.a></li>
              <li><@s.a href="${pmed7}">Global Health Diplomacy Collection</@s.a></li>
              <li><@s.a href="${pmed6}">Mental Health in Low- and Middle-Income Countries</@s.a></li>
              <li><@s.a href="${pmed5}">The Changing Nature of Global Health Institutions</@s.a></li>
              <li><@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>*</li>
              <li><@s.a href="${plos2}">Poverty Collection</@s.a>*</li>
              <li><@s.a href="${pmed1}">Grand Challenges Collection</@s.a></li>
              <li><@s.a href="${pmed3}">Social Medicine in the 21<sup>st</sup> Century</@s.a></li>
              <li><@s.a href="${pmed2}">Disease Mongering Collection</@s.a></li>
              <li><@s.a href="${pmed4}">Health Consequences of the Asian Tsunami</@s.a></li>
            </ul>
            </br>

            <#-- Variables for CompBio collection TOCs -->
            <#-- Add variables here -->
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i01" id="pcbi1"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i02" id="pcbi2"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i03" id="pcbi3"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i04" id="pcbi4"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i05" id="pcbi5"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i06" id="pcbi6"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i07" id="pcbi7"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i08" id="pcbi8"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i09" id="pcbi9"/>
             <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i10" id="pcbi10"/>
              <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v03.i11" id="pcbi11"/>

            <h3 class="replaced" id="pcbi">
              <a href="/static/pcbiCollections"><span><em>PLOS Computational Biology</em> Collections</span></a>
            </h3>
            <ul>
             <li><@s.a href="${plos18}">Reporting Guidelines Collection</@s.a>*</li>
            <li><@s.a href="${plos14}">Text Mining</@s.a>*</li>
              <li><@s.a href="${plos13}">The Human Microbiome Project Collection</@s.a>*</li>
              <li><@s.a href="${plos10}">Open Access Collection</@s.a>*</li>
              <li><@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>*</li>
              <li><@s.a href="${plos4}">RECOMB Regulatory Genomics and Systems Biology 2009</@s.a>*</li>
              <li><@s.a href="${plos7}">Epigenetics 2010</@s.a>*</li>
              <li><@s.a href="${pcbi1}">Ten Simple Rules</@s.a></li>
              <li><@s.a href="${pcbi2}">Education</@s.a></li>
              <li><@s.a href="${pcbi3}">Developing Computational Biology</@s.a></li>
              <li><@s.a href="${pcbi4}">Core Facilities</@s.a></li>
              <li><@s.a href="${pcbi5}">Biocurators</@s.a></li>
              <li><@s.a href="${pcbi6}">Conference Postcards</@s.a></li>
              <li><@s.a href="${pcbi7}">The Roots of Bioinformatics</@s.a></li>
              <li><@s.a href="${pcbi8}">Editors' Outlook</@s.a></li>
              <li><@s.a href="${pcbi9}">Bioinformatics: Starting Early</@s.a></li>
              <li><@s.a href="${pcbi10}">Software</@s.a></li>
              <li><@s.a href="${pcbi11}">Translational Bioinformatics</@s.a></li>
            </ul>
            </br>

            <#-- Variables for Genetics collection TOCs -->
            <#-- Add variables here -->
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v04.i01" id="pgen1"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v04.i02" id="pgen2"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v04.i03" id="pgen3"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v04.i04" id="pgen4"/>
            <h3 class="replaced" id="pgen">
              <a href="/static/pgenCollections"><span><em>PLOS Genetics</em> Collections</span></a>
            </h3>
            <ul>
              <li><@s.a href="${plos13}">The Human Microbiome Project Collection</@s.a>*</li>
              <li><@s.a href="${plos12}">Genetically Modified Insect Collection</@s.a>*</li>
              <li><@s.a href="${plos7}">Epigenetics 2010</@s.a>*</li>
              <li><@s.a href="${pgen1}">A Collection of Interviews by Jane Gitschier</@s.a></li>
              <li><@s.a href="${pgen2}">Aging: Bench to Bedside</@s.a></li>
              <li><@s.a href="${pgen3}">2009 Maize Genome Collection</@s.a></li>
              <li><@s.a href="${pgen4}">The Genome Network Project/FANTOM3 Collection</@s.a></li>
              <li><@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>*</li>
            </ul>
            </br>

            <#-- Variables for Pathogens collection TOCs -->
            <#-- Add variables here -->
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v05.i01" id="ppat1"/>
            <h3 class="replaced" id="ppat">
              <a href="/static/ppatCollections"><span><em>PLOS Pathogens</em> Collections</span></a>
            </h3>
            <ul>
            <li><@s.a href="${plos15}">Malaria: targets and drugs for all stages</@s.a>*</li>
              <li><@s.a href="${plos12}">Genetically Modified Insect Collection</@s.a>*</li>
              <li><@s.a href="${plos10}">Open Access Collection</@s.a>*</li>
              <li><@s.a href="${plos8}"><em>PLOS Pathogens</em> and <em>PLOS Neglected Tropical Diseases</em> Twinning Collection</@s.a>*</li>
              <li><@s.a href="${plos7}">Epigenetics 2010</@s.a>*</li>
              <li><@s.a href="${ppat1}">Pearls</@s.a></li>
              <li><@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>*</li>
            </ul>
            </br>

            <#-- Variables for ONE collection TOCs -->
            <#-- Add variables here -->
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i01" id="pone1"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i02" id="pone2"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i03" id="pone3"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i04" id="pone4"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i05" id="pone5"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i06" id="pone6"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i07" id="pone7"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i08" id="pone8"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i09" id="pone9"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i10" id="pone10"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i11" id="pone11"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i14" id="pone14"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i12" id="pone12"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i13" id="pone13"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i15" id="pone15"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i16" id="pone16"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v01.i13" id="plos13"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i17" id="pone17"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i18" id="pone18"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i19" id="pone19"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i20" id="pone20"/>
             <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v02.i21" id="pone21"/>
                <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v07.i20" id="pmed20"/>

            <h3 class="replaced" id="pone">
              <a href="/static/poneCollections"><span><em>PLOS ONE</em> Collections</span></a>
            </h3>
            <ul>
              <li><@s.a href="${plos12}">Genetically Modified Insect Collection</@s.a>*</li>
              <li><@s.a href="${plos10}">Open Access Collection</@s.a>*</li>
              <li><@s.a href="${plos9}">World Health Report 2012: No Health Without Research</@s.a>*</li>
              <li><@s.a href="${plos7}">Epigenetics 2010</@s.a>*</li>
              <li><@s.a href="${plos6}">Diversity in the Nearshore: The NaGISA Collection</@s.a>*</li>
              <li><@s.a href="${pone11}">The FMAP Collection</@s.a></li>
              <li><@s.a href="${pone10}">The HMAP Collection</@s.a></li>
              <li><@s.a href="${pone6}">Biogeography of Deep-Water Chemosynthetic Ecosystems - The ChEss Collection</@s.a>*</li>
              <li><@s.a href="${plos5}">The POST Collection</@s.a>*</li>
              <li><@s.a href="${pone9}">Marine Biodiversity and Biogeography - Regional Comparisons of Global Issues</@s.a></li>
              <li><@s.a href="${pone7}">The MarBOL Collection</@s.a></li>
              <li><@s.a href="${pone8}">Biodiversity of Saba Bank</@s.a></li>
              <li><@s.a href="${pone15}">Marine Life on Seamounts &ndash; The CenSeam Collection</@s.a></li>
              <li><@s.a href="${plos4}">RECOMB Regulatory Genomics and Systems Biology 2009</@s.a>*</li>
              <li><@s.a href="${pone5}">The DREAM systems biology challenges: a Dialogue for Reverse Engineering Assessment and Methods</@s.a></li>
              <li><@s.a href="${plos3}">The TOPP Collection</@s.a>*</li>
              <li><@s.a href="${pone1}">Stress-Induced Depression and Comorbidities: From Bench to Bedside</@s.a></li>
              <li><@s.a href="${pone2}">The Paleontology Collection</@s.a></li>
              <li><@s.a href="${pone3}">Prokaryotic Genome Collection</@s.a></li>
              <li><@s.a href="${pone4}">Structural Biology and Human Health: Medically Relevant Proteins from the SGC</@s.a>*</li>
              <li><@s.a href="${pone14}">Proceedings of the Third International Barcode of Life Conference, Mexico City</@s.a></li>
              <li><@s.a href="${pone12}">RosettaCon 2010</@s.a></li>
              <li><@s.a href="${pone13}">Animals, Research, and Alternatives: Measuring Progress 50 Years Later</@s.a></li>
              <li><@s.a href="${plos11}">Voluntary Medical Male Circumcision for HIV Prevention: The Cost, Impact, and Challenges of Accelerated Scale-Up in Southern and Eastern Africa</@s.a>*</li>
              <li><@s.a href="${pone16}">The Mice Drawer System Experiment and the Space Endurance Record-Breaking Mice</@s.a></li>
              <li><@s.a href="${plos13}">The Human Microbiome Project Collection</@s.a>*</li>
              <li><@s.a href="${pone17}">NeuroMapping and Therapeutics </@s.a></li>
              <li><@s.a href="${pone18}">Synthetic Biology </@s.a></li>
              <li><@s.a href="${pone19}">Altmetrics Collection </@s.a></li>
              <li><@s.a href="${pone20}">The World Register of Marine Species  </@s.a></li>
              <li><@s.a href="${plos14}">Text Mining</@s.a>*</li>
                 <li><@s.a href="${plos16}">Measuring Coverage in Maternal, Newborn, and Child Health</@s.a>*</li>
                   <li><@s.a href="${pmed20}">Maternal Health Task Force Year 2 Collection (2012-13)</@s.a>*</li>
                  <li><@s.a href="${plos17}">Ecological Impacts of Climate Change</@s.a>*</li>
                   <li><@s.a href="${plos18}">Reporting Guidelines Collection</@s.a>*</li>
                    <li><@s.a href="${pone21}">RosettaCon 2012  </@s.a></li>
            </ul>
            </br>

            <#-- Variables for NTDs collection TOCs -->
            <#-- Add variables here -->
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i01" id="pntd1"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i02" id="pntd2"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i03" id="pntd3"/>
             <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i04" id="pntd4"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i05" id="pntd5"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i06" id="pntd6"/>
            <@s.url action="issue" namespace="/article/browse" issue="info:doi/10.1371/issue.pcol.v08.i07" id="pntd7"/>
            <h3 class="replaced" id="pntd">
              <a href="/static/pntdCollections"><span><em>PLOS Neglected Tropical Diseases</em> Collections</span></a>
            </h3>
            <ul>
             <li><@s.a href="${plos18}">Reporting Guidelines Collection</@s.a>*</li>
             <li><@s.a href="${pntd7}">Historical Profiles and Perspectives</@s.a></li>
            <li><@s.a href="${pntd6}">Strongyloides Collection</@s.a></li>
            <li><@s.a href="${pntd5}">Top Ten Research Article Collection</@s.a></li>
              <li><@s.a href="${pntd4}">The Geopolitics of Neglected Tropical Diseases</@s.a></li>  
            <li><@s.a href="${pntd3}">A Research Agenda for the Control and Elimination of Human Helminthiases</@s.a></li>
              <li><@s.a href="${plos12}">Genetically Modified Insect Collection</@s.a>*</li>
              <li><@s.a href="${pntd2}">Sleeping Sickness</@s.a></li>
              <li><@s.a href="${plos9}">World Health Report 2012: No Health Without Research</@s.a>*</li>
              <li><@s.a href="${plos8}"><em>PLOS Pathogens</em> and <em>PLOS Neglected Tropical Diseases</em> Twinning Collection</@s.a>*</li>
              <li><@s.a href="${pntd1}">Rabies Collection</@s.a></li>
              <li><@s.a href="${plos1}">Genomics of Emerging Infectious Disease</@s.a>*</li>
              <li><@s.a href="${plos2}">Poverty Collection</@s.a>*</li>
            </ul>
            </br>

            <#-- Footnote explaining cross journal collections -->
            <p style="margin:0 0 60px;">
              <span class="footnote">* This collection contains articles from multiple PLOS journals.</span>
            </p>
          </div><#-- static link -->

        </div><#-- collections -->

      </div><#-- col-1 -->
    </div><#-- layout-625_300 -->

  </div><#-- pagebdy -->
</div><#-- pagebdy-wrap -->
