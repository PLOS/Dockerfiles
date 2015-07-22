/* 
 * icbDetection.js
 * 
 * Copyright (c) 2009
 * Julian Atienza-Herrero julian.atienza-herrero at sgc.ox.ac.uk
 * SGC University of Oxford. http://www.sgc.ox.ac.uk
 * All rights reserved.
 * 
 * 
 * icbDetection.js is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * icbDetection.js is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with icbDetection.js.  If not, see <http://www.gnu.org/licenses/>.
 */

var ClassID = "ActiveIcm.ActiveIcmCtl";
var ICB_MIME_TYPE = "application/x-molsoft-icb";
var PLUGIN_KEYWORD_NAME = "molsoft";
var WIDTH  = "100%";
var HEIGHT = "100%";
var ACTIVEICM_LATEST_VERSION_URL = '/enhanced/communal/activeICM.xml';

var httpRequest;
var os, browser;


var currentVersion = -1;
var icmPluginEnabled = false;
var icmPluginNotAccessible = true;
var xml_version;
var latestVersion;
var datapack_inserted = false;
var message_inserted = false;
var status_message_inserted = false;

function get_latest_version(callback1){
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
        httpRequest = new XMLHttpRequest();
        httpRequest.onreadystatechange = function(callback){
            when_ready(callback1);
        };
    } else if (window.ActiveXObject) { // IE
        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
        if (httpRequest) {
            httpRequest.onreadystatechange = function(callback){
                when_ready(callback1);
            };
        }
    }
    //asynchronous
    httpRequest.open('GET', ACTIVEICM_LATEST_VERSION_URL, true);
    httpRequest.send(null);
}

function process_response(responseXML, callback){//substitute     dump
    var x = responseXML.getElementsByTagName(xml_version);
    for (i = 0; i < x.length; i++) {
        var attributes = x[i].attributes;
        if ((attributes[1].value == os) && (attributes[0].value == browser)) {
            latestVersion = x[i].childNodes[0].nodeValue;
            if(callback){
                callback();

            }
        }
    }
}

function when_ready(callback){
    if (httpRequest.readyState == 4) {
        if(httpRequest.status == 200){
            process_response(httpRequest.responseXML, callback);
        }
        else
            window.alert(httpRequest.status);
    }
}

function detectBrowser() {
    var browser = "other";
    var userAgent = navigator.userAgent.toLowerCase();
    
    if(userAgent.indexOf("msie") != -1){
        browser = "msie";
    }
    else
    if (userAgent.indexOf("firefox") != -1) {
        browser = "firefox";
    }
    else
    if (userAgent.indexOf("chrome") != -1) {
        browser = "chrome";
    }
    else
    if (userAgent.indexOf("safari") != -1) {
        browser = "safari";
    }
    return browser;
}

function isWin64(){
    var userAgent = navigator.userAgent.toLowerCase();
    if (userAgent.indexOf("win64")!=-1){
        return true;
    }
    return false;
}

function detectOS(){
    var os = "other";
    var userAgent = navigator.userAgent.toLowerCase();
    if(userAgent.indexOf("windows") != -1){
        os = "windows";
    }
    if(userAgent.indexOf("mac") != -1){
        os = "mac";
    }
    if(userAgent.indexOf("linux") != -1){
        os = "linux";
    }
    return os;
}


function getCurrentVersion(){    
    ppversion = -1;
    if( browser == "msie" ){
        document.write('<script type=\"text/vbscript\"> \n');
        document.write('on error resume next \n');
        document.write('Dim icbObject \n');
        document.write('set icbObject = CreateObject("' + ClassID + '") \n');
        document.write('ppversion = icbObject.pluginVersion \n');
        document.write('<\/script> \n');

    }else{
        icbObjectVersion = document.createElement("div");
        icbObjectVersion.setAttribute("style", "visibility:hidden");
        icbObjectVersion.innerHTML = "<OBJECT ID=\"icbObjectVersion\" type=\"" + ICB_MIME_TYPE+ "\" WIDTH=\"0%\" HEIGHT=\"0%\" ></OBJECT>";
        document.body.appendChild(icbObjectVersion);
        ppversion = document.getElementById('icbObjectVersion').pluginVersion;
        if(detectBrowser()!="safari" || (detectOS()== "linux" && detectBrowser()!="firefox"))
            document.body.removeChild(icbObjectVersion);
    }
    return ppversion;
}
            
function isIcmPluginEnabled(){
    if(browser == "msie"){
        result = false;
        document.write('<script type=\"text/vbscript\"> \n');
        document.write('on error resume next \n');
        document.write('result = IsObject(CreateObject("' + ClassID + '")) \n');
        document.write('</SCRIPT> \n');
        return result;
    }else{
        if (navigator.plugins && navigator.plugins.length > 0) {
            for (i=0; i < navigator.plugins.length; i++ ) {
                if (navigator.plugins[i].name.toLowerCase().indexOf(PLUGIN_KEYWORD_NAME)!= -1){
                    return true;
                }
            }
        }
        return false;
    }
}


function insertDatapackObject(datapackFileName){
    document.body.style.backgroundColor = "black";
    var ActiveIcmCtl = document.createElement("div");
    if(currentVersion <= 111){
        ActiveIcmCtl.innerHTML = "<OBJECT ID=\"ActiveIcmCtl\" type=\"" + ICB_MIME_TYPE+ "\" data=\"./" + datapackFileName + "\" WIDTH=\"100%\" HEIGHT=\"100%\" ></OBJECT>";
    }else{
        ActiveIcmCtl.innerHTML = "<OBJECT ID=\"ActiveIcmCtl\" type=\"" + ICB_MIME_TYPE+ "\" WIDTH=\"100%\" HEIGHT=\"100%\" >" + "<param name=\"projectFile\" value=\"" +datapackFileName +"\" /></OBJECT>";
    }
    if(!datapack_inserted){//this is a problem with chrome and for some reason it runs this function twice
        document.body.appendChild(ActiveIcmCtl);
        datapack_inserted = true;
    }
}

function insertDatapackObjectAfterCleanUp(datapackFileName){
    document.body.innerHTML = "";
    insertDatapackObject(datapackFileName);
}


function insertStatusBanner(){
    var statusDIV = document.createElement("div");
    statusDIV.setAttribute("name", "statusDIV");
    var innerHTML = "";
    if ( (browser != "other") && (os !="other")){
        innerHTML += " Operating system and Browser are supported.<br>";
    }else{
        innerHTML += " Operating system and Browser are NOT supported.<br>";
    }
    if (icmPluginEnabled){
        innerHTML +=  "activeICM plugin detected<br>";
    }else{
        innerHTML +=  "activeICM plugin NOT detected<br>";
    }
    if(icmPluginNotAccessible){
        innerHTML +=  "activeICM plugin not valid for the platform" + currentVersion + "<br>";
    }else{
        innerHTML +=  "activeICM plugin version " + currentVersion + "<br>";
    }
    innerHTML +=  "LATEST PLUGIN VERSION AVAILABLE " + latestVersion + "<br>";
    innerHTML += navigator.userAgent.toLowerCase();
    statusDIV.innerHTML = innerHTML;
    if(!status_message_inserted){
        document.body.appendChild(statusDIV);
        status_message_inserted = true;
    }
}

function insertIframe(src,id){
    /*http://stackoverflow.com/questions/1350767/accessing-javascript-variable-from-html-page-in-same-domain
     *http://www.w3schools.com/TAGS/tag_iframe.asp
     **/
    var iframe = document.createElement("iframe");
    iframe.setAttribute("src", src);
    iframe.setAttribute("id", id);
    iframe.setAttribute("frameborder",0);
    iframe.setAttribute("width","100%");
    iframe.setAttribute("height","100%");
    document.body.appendChild(iframe);
}

function append_message(id, contents, attributes){
    var message = document.createElement("div");
    message.setAttribute("id", id);
    if (attributes){
        for(i = 0; i< attributes.length;i++)
            message.setAttribute(attributes[i][0], attributes[i][1]);
    }
    message.innerHTML = contents;
    if (!message_inserted){
        document.body.appendChild(message);
        message_inserted = true;
    }
}


function compose_unsupported_platform_message(){
    return "<p align=\"center\"><b>Operating System or Browser not supported</b></p><table align=\"center\" bgcolor=\"#CC0000\" cellpadding =\"10\"><td><p>Contact us for further information: <a href=\"mailto:&#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107\"> &#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107</a></p></td></table>";

}

function compose_plugin_not_accessible_safari_mac_64_message(){
    return "<p align=\"center\"><h1>Safari in 64-bit mode detected</h1></p><table bgcolor=\"#CC0000\" cellpadding =\"10\"><td><p>The activeICM plugin is not yet supported for Safari running in 64-bit mode</p><p>You can still use Safari by running it in 32-bit mode:</p><p>Note: you'll need to quit Safari - print this page before continuing <input type=\"button\"; onClick=\"window.print()\"; value=\"Print\" /></p> <ol><li>Quit Safari (Cmd+Q)</li><li>On Finder, click on 'Go' and then 'Applications'</li><li>Find Safari and Ctrl-click on it</li><li>Pick 'Get Info'</li><li>Check the 'Open in 32-bit mode' box and close the dialog</li><li>Restart Safari</li></ol></p></td><td><img style=\"border:none\" src=../images/safari4-32bit.png width=\"200\"></td></table><h3>Support: <a href=\"mailto:&#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107\"> &#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107 </a></h3>";
}

function compose_plugin_not_accessible_win64_message(){
    return "<p align=\"center\"><h1>Internet Explorer in 64-bit mode detected</h1></p><table bgcolor=\"#CC0000\" cellpadding =\"10\"><td><p>The activeICM plugin is not yet supported for Internet Explorer running in 64-bit mode</p><p>You can still use Internet Explorer by running it in 32-bit mode:</p><ol><li>Quit Internet Explorer (64-bit)</li><li>Click on the 'Windows/ Start' icon and then 'All Programs'</li><li>Launch Internet Explorer</li></ol></p></td><td><img style=\"border:none\" src=../images/IEwin64.png width=\"400\"></td></table><h3>Support: <a href=\"mailto:&#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107\"> &#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107 </a></h3>";
}


function compose_new_plugin_IE(datapackFileName){
    var message = "<p align=\"center\"><h1>Newer version of plugin available</h1></p>";
    message += "<table bgcolor=\"#C7A317\" cellpadding =\"10\"><td>";
    message += "<p>You have an older version of the activeICM plugin installed in your computer.";
    message += "We recommend installing the latest version to ensure full functionality of this enhanced article.</p>";
    message += "<ul><li>Your version: "+currentVersion+"</li><li>Latest version: "+latestVersion+"</li></ul><p>";
    message += "Click on the button to the right to download the latest free activeICM plugin and to read the installation instructions.</p>";
    message += "  <p><b>Alternatively: <a href=\"javascript:insertDatapackObjectAfterCleanUp('" + datapackFileName + "');\">Launch the enhanced article</a></b>";
    message += " using the present version of the plugin.</p></td><td><a  href=\"http://www.molsoft.com/getbrowser.cgi?product=activeicm&act=list\"><img style=\"border:none\" src=../images/download_activeICM.png width=\"200\"></a></td></table><h3>";
    message += "<b>After installation please restart Internet Explorer. A secutiry bar will be displayed - please allow the activeICM control to run.</b></h3><h3>Support: <a href=\"mailto:&#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107\"> &#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107 </a></h3>";
    return message;
}


function compose_new_plugin(datapackFileName){
    var message = "<p align=\"center\"><h1>Newer version of plugin available</h1></p><table bgcolor=\"#C7A317\" cellpadding =\"10\"><td>";
    message += "<p>You have an older version of the activeICM plugin installed in your computer.";
    message += "We recommend installing the latest version to ensure full functionality of this enhanced article.</p>";
    message += "<ul><li>Your version: "+currentVersion+"</li><li>Latest version: "+latestVersion+"</li></ul><p>";
    message += "Click on the button to the right to download the latest free activeICM plugin and to read the installation instructions.</p>";
    message += "  <p><b>Alternatively: <a href=\"javascript:insertDatapackObjectAfterCleanUp('" + datapackFileName + "');\">Launch the enhanced article</a></b>";
    message += " using the present version of the plugin.</p></td>";
    message += "<td><a  href=\"http://www.molsoft.com/getbrowser.cgi?product=activeicm&act=list\"><img style=\"border:none\" src= \"../images/download_activeICM.png\" width=\"200\"></a></td></table>";
    message += "<h3><b>After installation please restart your browser.</b></h3><h3>Support: <a href=\"mailto:&#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107\"> &#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107 </a> </h3>";
    return message;     
}

function compose_no_plugin_IE(){
    return "<p align=\"center\"><h1>Visualisation plugin missing</h1></p><table bgcolor=\"#CC0000\" cellpadding =\"10\"><td><p>A web plugin is required for the enhanced functionality of this article. Click on the button to the right to download the free activeICM plugin and to read the installation instructions.</p></td><td><a href=\"http://www.molsoft.com/getbrowser.cgi?product=activeicm&act=list\"><img style=\"border:none\" src=\"../images/download_activeICM.png\" width=\"200px\"></a></td></table><h3><b>After installation please restart Internet Explorer. A security bar will be displayed - please allow the activeICM control to run.</b></h3><h3>Support: <a href=\"mailto:&#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107\"> &#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107 </a></h3>";
}

function compose_no_plugin_safari_win(){
    return "<p align=\"center\"><h1>Visualisation plugin missing</h1></p><p align=\"center\"><b>***Click on CANCEL***</b><br>on the 'Safari can't find internet plug-in' window and follow the instructions below.</p><table bgcolor=\"#CC0000\" cellpadding =\"10\"><td><p>A web plugin is required for the enhanced functionality of this article. Click on the button to the right to download the free activeICM plugin and to read the installation instructions.</p></td><td><a href=\"http://www.molsoft.com/getbrowser.cgi?product=activeicm&act=list\"><img style=\"border:none\" src=../images/download_activeICM.png width=\"200px\"></a></td></table><h3><b>After installation please restart  your browser.</b></h3><h3>Support: <a href=\"mailto:&#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107\"> &#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107 </a></h3>";
}
function compose_no_plugin(){
    return "<p align=\"center\"><h1>Visualisation plugin missing</h1></p><table bgcolor=\"#CC0000\" cellpadding =\"10px\"><td><p>A web plugin is required for the enhanced functionality of this article. Click on the button to the right to download the free activeICM plugin and to read the installation instructions.</p></td><td><a href=\"http://www.molsoft.com/getbrowser.cgi?product=activeicm&act=list\"><img style=\"border:none\" src=\"../images/download_activeICM.png\" width=\"200\"></a></td></table><h3><b>After installation please restart  your browser.</b></h3><h3>Support: <a href=\"mailto:&#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107\"> &#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107 </a></h3>";
}
function compose_plugin_no_supported(){
    return "<p align=\"center\" style=\"color:black;background-color:white;\"><h1>Visualisation plugin out-of-date</h1></p><table cellpadding =\"10px\" style=\"color:white;\"><td><p>Your version of activeICM plugin is no longer supported. Please update to the newest version available by clicking on the button to the right to download the free activeICM plugin and to read the installation instructions.</p></td><td><a href=\"http://www.molsoft.com/getbrowser.cgi?product=activeicm&act=list\"><img style=\"border:none\" src=\"../images/download_activeICM.png\" width=\"200\"></a></td></table><h3><b>After installation please restart  your browser.</b></h3><h3>Support: <a href=\"mailto:&#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107\"> &#105&#115&#101&#101&#64&#115&#103&#99&#46&#111&#120&#46&#97&#99&#46&#117&#107 </a></h3>";
}

function generateICBDocument(datapackFileName){
    //insertStatusBanner();
    
    switch(true){
        case ((browser == "other") || (os =="other")):
            //insertIframe("not_supported_platform.html", "unsupported_platform");
            append_message("unsupported_platform", compose_unsupported_platform_message());
            break;
        case (icmPluginEnabled && icmPluginNotAccessible && browser =="safari" && os == "mac"):
            //insertIframe("plugin_not_accessible.html", "plugin_not_accessible");
            append_message("plugin_not_accessible",compose_plugin_not_accessible_safari_mac_64_message());
            break;
        case (icmPluginEnabled && icmPluginNotAccessible):
            //insertIframe("plugin_not_accessible.html", "plugin_not_accessible");
            append_message("no_plugin",compose_plugin_no_supported(),[["style","color:white; background-color:black;"]]);
            break;
        case (icmPluginEnabled && (latestVersion <= currentVersion)):
            insertDatapackObject(datapackFileName);
            break;
        case (icmPluginEnabled && (latestVersion > currentVersion) && (browser == "msie")):
            //insertIframe("new_plugin_IE.html", "new_plugin_IE");
            append_message("new_plugin_IE",compose_new_plugin_IE(datapackFileName));
            break;
        case (icmPluginEnabled && (latestVersion > currentVersion)):
            //insertIframe("new_plugin.html", "new_plugin");
            append_message("new_plugin",compose_new_plugin(datapackFileName));
            break;
        case (!icmPluginEnabled  && (browser == "msie") && isWin64()):
            append_message("new_plugin",compose_plugin_not_accessible_win64_message(datapackFileName));
            break;
        case (!icmPluginEnabled  && (browser == "msie")):
            //insertIframe("no_plugin_IE.html", "no_plugin_IE");
            append_message("no_plugin_IE",compose_no_plugin_IE());
            break;
        case (!icmPluginEnabled  && (browser == "safari" && os == "windows")):
            //insertIframe("no_plugin_safari_win.html", "no_plugin_safari_win");
            append_message("no_plugin_safari_win",compose_no_plugin_safari_win());
            break;
        default:
            //insertIframe("no_plugin.html", "no_plugin");
            append_message("no_plugin",compose_no_plugin());
    }
}



/*http://ajaxian.com/archives/serial-async-xhr*/
function composeICBdocument(datapackFileName) {
    getLocalParameters(function () {
        get_latest_version(function () {
            generateICBDocument(datapackFileName);
//            insertStatusBanner();
        });
    });
}
/*This function considers that the global variables browser, os and currentVersion have been assigned*/
function detect_pluginAccessibility(){
    icmPluginNotAccessible = icmPluginEnabled && (currentVersion == undefined || currentVersion == -1);
/*if (os =="windows"){ //this is because the pluginVersion function is not defined in 111
        icmPluginNotAccessible = !icmPluginEnabled;
        currentVersion = -1;
    }*/
}

function getLocalParameters(callback2){
    browser = detectBrowser();
    os = detectOS();
    xml_version = (browser == "safari" || browser == "chrome") ?  "activeICM_latest_version" : "tns:activeICM_latest_version";
    icmPluginEnabled = isIcmPluginEnabled();
    currentVersion = -1;
    currentVersion = getCurrentVersion();
    detect_pluginAccessibility();
    if (callback2) {
        callback2();
    } 
}



