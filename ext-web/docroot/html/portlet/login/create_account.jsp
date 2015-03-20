
<%
/**
 * Copyright (c) 2000-2009 Liferay, Inc. All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="/html/portlet/login/init.jsp"%>


<%@page import="pl.mamzdanie.exception.NotAcceptRulesException"%>
<%@page import="com.liferay.portal.PhoneNumberException"%>
<%@page import="pl.mamzdanie.exception.PositionException"%>
<%@page import="pl.mamzdanie.exception.CompanyNameException"%>
<%@page import="pl.mamzdanie.exception.CompanyPostalCodeException"%>
<%@page import="pl.mamzdanie.exception.CompanyCityException"%>
<%@page import="pl.mamzdanie.exception.CompanyAddressException"%>
<script type="text/javascript">

var firstStepButton=null;
var secondStepButton=null;

//possible colors: green, red
function makeButtonColor(button, colorName){
	var redIndex=button.className.indexOf(colorName);
	if(redIndex!=-1)
		return;
	else{
		var charsToCut=5;//green
		if(colorName=='green')
			charsToCut=3;//red
		var finalClassName=button.className.substring(0,button.className.length-charsToCut);
		button.className=finalClassName+colorName;
	}
}

function toggleNotPersonFields(show){
	var style='none';
	if(show)
		style='';

	document.getElementById('phone_row').style.display=style;
	document.getElementById('position_row').style.display=style;
}

function clearButtonColor(compareButton, button){
	if(compareButton==null)
		return;
	if(button!=compareButton)
		makeButtonColor(compareButton,'red');
}

function iAmPerson(){
	var button=document.getElementById('person_button');
	clearButtonColor(secondStepButton,button);
	makeButtonColor(button,'green');

	secondStepButton=button;

	setAccountType('CONSULTANT_PERSON');
	
	toggleNotPersonFields(false);
	toggleRegisterData(true);
	toggleRightCol(false);
}

function iAmCompany(){
	var button=document.getElementById('company_button');
	clearButtonColor(secondStepButton,button);
	makeButtonColor(button,'green');

	secondStepButton=button;

	setAccountType('CONSULTANT_COMPANY');

	toggleNotPersonFields(true);
	toggleRegisterData(true);
	toggleRightCol(true);
}

function getParentToRecolor(button){
	var buttonDivToRecolor=button.parentNode.parentNode;
	return buttonDivToRecolor;
}

function wannaBeConsultant(){
	var button=document.getElementById('consultant_button');
	clearButtonColor(firstStepButton,button);

	if(getAccountType()=='EMITER')
		toggleRegisterData(false);
	
	firstStepButton=button;
	makeButtonColor(button,'green');

	toggleChoiceButtons(true);
}

function wannaBeEmiter(){
	var button=document.getElementById('emiter_button');
	clearButtonColor(firstStepButton,button);
	
	firstStepButton=button;
	makeButtonColor(button,'green');

	toggleChoiceButtons(false);
	clearButtonColor(secondStepButton,null);

	setAccountType('EMITER');

	toggleNotPersonFields(true);
	toggleRegisterData(true);
	toggleRightCol(true);
}

function setAccountType(accType){
	var accountType=document.getElementById('account_type');
	accountType.value=accType;
}

function getAccountType(){
	var accountType=document.getElementById('account_type');
	return accountType.value;
}

function toggleChoiceButtons(show){
	toggle('choice_buttons',show);
}

function toggleRegisterData(show){
	toggle('whole_data', show);
}

function toggleRightCol(show){
	toggle('right_col', show);
}

function toggle(elemId, show){
	var style='block';
	if(!show)
		style='none';
	document.getElementById(elemId).style.display=style;
}

function initialize(){
	var accountType=getAccountType();
	if(accountType=='EMITER'){
		wannaBeEmiter();
	}
	else if(accountType=='CONSULTANT_COMPANY'){
		wannaBeConsultant();
		iAmCompany();
	}
	else if(accountType=='CONSULTANT_PERSON'){
		wannaBeConsultant();
		iAmPerson();
	}
}

jQuery(document).ready(function() {
	initialize()
	});

</script>

<%!
private String getParamValue(HttpServletRequest request, String paramName){
	String paramValue=request.getParameter(paramName);
	if(paramValue==null || "null".equals(paramValue))
		return "";
	else
		return paramValue;
}
%>

<div class="dots_big_h main_dots_margin"></div>
<div class="rejestracja"></div>

<div id="register_boxes">
<div class="register_left_box">
<div class="rounded_box">
<div class="top_left top_left_grey"></div>
<div class="top_right top_right_grey"></div>
<div class="inside_grey">
<div class="inside_content">

<div class="consultant_img"></div>
<div class="register_box_content">Chcę brać udział w konsultacjach - jestem osobą fizyczną bądź instytucją. Zarejestruj się:
<div class="dots_h dots_margin"></div>
<div class="big_button register_big_button red" id="consultant_button">
<div class="left"></div>
<div class="middle"><a href="#" onclick="wannaBeConsultant(); return false;">Jako uczestnik konsultacji</a></div>
<div class="right"></div>
</div>
</div>
<p class="nobottomgap"></p>
</div>
<div class="clear"></div>
</div>
<div class="bottom_left bottom_left_grey"></div>
<div class="bottom_right bottom_right_grey"></div>
</div>
</div>

<div class="register_right_box">
<div class="rounded_box">
<div class="top_left top_left_grey"></div>
<div class="top_right top_right_grey"></div>
<div class="inside_grey">
<div class="inside_content">

<div class="consultant_img emiter_mod"></div>
<div class="register_box_content">Chcę emitować konsultacje społeczne (dla instytucji). Zarejestruj się:
<div class="dots_h dots_margin"></div>
<div class="big_button register_big_button red" id="emiter_button">
<div class="left"></div>
<div class="middle"><a href="#" onclick="wannaBeEmiter(); return false;">Jako organizator konsultacji</a></div>
<div class="right"></div>
</div>
</div>
<p class="nobottomgap"></p>
</div>
<div class="clear"></div>
</div>
<div class="bottom_left bottom_left_grey"></div>
<div class="bottom_right bottom_right_grey"></div>
</div>
</div>
</div>

<div class="clear"></div>

<div id="choice_buttons">
<div class="rounded_box" style="margin-top:15px">
<div class="top_left top_left_grey"></div>
<div class="top_right top_right_grey"></div>
<div class="inside_grey">
<div class="inside_content">

<div id="center_choice_buttons">
<div class="big_button red" style="margin-right:20px; float:left" id="person_button">
<div class="left"></div>
<div class="middle"><a href="#" onclick="iAmPerson('person_button'); return false;">Jestem osobą fizyczną</a></div>
<div class="right"></div>
</div>

<div class="big_button red" id="company_button">
<div class="left"></div>
<div class="middle"><a href="#" onclick="iAmCompany('company_button'); return false;">Jestem instytucją</a></div>
<div class="right"></div>
</div>
</div>


<p class="nobottomgap"></p>
</div>
<div class="clear"></div>
</div>
<div class="bottom_left bottom_left_grey"></div>
<div class="bottom_right bottom_right_grey"></div>
</div>
</div>

<%
String openId = ParamUtil.getString(request, "openId");

User user2 = null;
Contact contact2 = null;

PasswordPolicy passwordPolicy = PasswordPolicyLocalServiceUtil.getDefaultPasswordPolicy(company.getCompanyId());

Calendar birthday = CalendarFactoryUtil.getCalendar();

birthday.set(Calendar.MONTH, Calendar.JANUARY);
birthday.set(Calendar.DATE, 1);
birthday.set(Calendar.YEAR, 1970);

boolean male = BeanParamUtil.getBoolean(contact2, request, "male", true);
%>

<form
	action="<portlet:actionURL windowState="<%= WindowState.MAXIMIZED.toString() %>"><portlet:param name="saveLastPath" value="0" /><portlet:param name="struts_action" value="/login/create_account" /></portlet:actionURL>"
	class="uni-form" method="post" name="<portlet:namespace />fm">
	<input type="hidden" name="<portlet:namespace />account_type" id="account_type" value="<%=request.getParameter("account_type") %>"/>
	<input
	name="<portlet:namespace /><%= Constants.CMD %>" type="hidden"
	value="<%= Constants.ADD %>" /> <input
	name="<portlet:namespace />openId" type="hidden"
	value="<%= HtmlUtil.escape(openId) %>" /> 
	<liferay-ui:error
	exception="<%= CaptchaTextException.class %>"
	message="text-verification-failed" /> 
	<liferay-ui:error
	exception="<%= ContactFirstNameException.class %>"
	message="please-enter-a-valid-first-name" /> 
	<liferay-ui:error
	exception="<%= ContactLastNameException.class %>"
	message="please-enter-a-valid-last-name" /> 
	<liferay-ui:error
	exception="<%= DuplicateUserEmailAddressException.class %>"
	message="the-email-address-you-requested-is-already-taken" /> 
	<liferay-ui:error
	exception="<%= DuplicateUserIdException.class %>"
	message="the-user-id-you-requested-is-already-taken" /> 
	<liferay-ui:error
	exception="<%= DuplicateUserScreenNameException.class %>"
	message="the-screen-name-you-requested-is-already-taken" /> 
	<liferay-ui:error
	exception="<%= ReservedUserEmailAddressException.class %>"
	message="the-email-address-you-requested-is-reserved" /> 
	<liferay-ui:error
	exception="<%= ReservedUserIdException.class %>"
	message="the-user-id-you-requested-is-reserved" /> 
	<liferay-ui:error
	exception="<%= ReservedUserScreenNameException.class %>"
	message="the-screen-name-you-requested-is-reserved" /> 
	<liferay-ui:error
	exception="<%= UserEmailAddressException.class %>"
	message="please-enter-a-valid-email-address" /> 
	<liferay-ui:error
	exception="<%= UserIdException.class %>"
	message="please-enter-a-valid-user-id" /> 
	<liferay-ui:error
	exception="<%= NotAcceptRulesException.class %>"
	message="please-accept-rules" /> 
	<liferay-ui:error
	exception="<%= PhoneNumberException.class %>"
	message="please-enter-a-valid-phone" /> 
	<liferay-ui:error
	exception="<%= PositionException.class %>"
	message="please-enter-a-valid-position" /> 
	<liferay-ui:error
	exception="<%= CompanyNameException.class %>"
	message="please-enter-a-valid-company-name" /> 
	<liferay-ui:error
	exception="<%= CompanyCityException.class %>"
	message="please-enter-a-valid-company-city" /> 
	<liferay-ui:error
	exception="<%= CompanyPostalCodeException.class %>"
	message="please-enter-a-valid-company-postal-code" /> 
	<liferay-ui:error
	exception="<%= CompanyAddressException.class %>"
	message="please-enter-a-valid-company-address" /> 
	<liferay-ui:error
	exception="<%= UserPasswordException.class %>">

	<%
	UserPasswordException upe = (UserPasswordException)errorException;
	%>

	<c:if
		test="<%= upe.getType() == UserPasswordException.PASSWORD_CONTAINS_TRIVIAL_WORDS %>">
		<liferay-ui:message
			key="that-password-uses-common-words-please-enter-in-a-password-that-is-harder-to-guess-i-e-contains-a-mix-of-numbers-and-letters" />
	</c:if>

	<c:if
		test="<%= upe.getType() == UserPasswordException.PASSWORD_INVALID %>">
		<liferay-ui:message
			key="that-password-is-invalid-please-enter-in-a-different-password" />
	</c:if>

	<c:if
		test="<%= upe.getType() == UserPasswordException.PASSWORD_LENGTH %>">
		<%= LanguageUtil.format(pageContext, "that-password-is-too-short-or-too-long-please-make-sure-your-password-is-between-x-and-512-characters", String.valueOf(passwordPolicy.getMinLength()), false) %>
	</c:if>

	<c:if
		test="<%= upe.getType() == UserPasswordException.PASSWORDS_DO_NOT_MATCH %>">
		<liferay-ui:message
			key="the-passwords-you-entered-do-not-match-each-other-please-re-enter-your-password" />
	</c:if>
</liferay-ui:error> <liferay-ui:error exception="<%= UserScreenNameException.class %>"
	message="please-enter-a-valid-screen-name" /> <c:if
	test='<%= SessionMessages.contains(request, "missingOpenIdUserInformation") %>'>
	<span class="portlet-msg-info"> <liferay-ui:message
		key="you-have-successfully-authenticated-please-provide-the-following-required-information-to-access-the-portal" />
	</span>
</c:if>

<div id="whole_data">
<div class="register_data">
<div class="register_text">Wypełnij poniższe pola i zaakceptuj warunki korzystania z serwisu www.MamZdanie.org.pl aby ukończyć proces rejestracji:</div>
<div id="left_col">
<div class="rounded_box">
<div class="top_left top_left_grey"></div>
<div class="top_right top_right_grey"></div>
<div class="inside_grey">
<div class="inside_content">

<div class="details_header details-margin">Dane ogólne:</div>
<div class="dots_h"></div>

<table>
<tr>
<td style="width:105px" >Imię*: </td><td>
<div class="input_row">
	<div class="left"></div>
	<liferay-ui:input-field model="<%= Contact.class %>"
	bean="<%= contact2 %>" field="firstName" className="middle" />
	<div class="right"></div>
</div>
	</td>
</tr>
<tr>
<td>Nazwisko*: </td><td>
<div class="input_row">
	<div class="left"></div>
	<liferay-ui:input-field model="<%= Contact.class %>"
	bean="<%= contact2 %>" field="lastName" className="middle" />
	<div class="right"></div>
</div>
</td>
</tr>
<tr>
<td>Adres e-mail*: </td><td><div class="input_row">
	<div class="left"></div>
	<liferay-ui:input-field model="<%= User.class %>" bean="<%= user2 %>" field="emailAddress"  className="middle"/>
	<div class="right"></div>
</div></td>
</tr>
<tr id="phone_row">
<td>Telefon*: </td><td><div class="input_row">
	<div class="left"></div>
	<input name="<portlet:namespace />phone" type="text" value="<%=getParamValue(request,"phone") %>" class="middle" maxlength="20"/>
	<div class="right"></div>
</div></td>
</tr>
<tr id="position_row">
<td>Stanowisko w organizacji*: </td><td><div class="input_row">
	<div class="left"></div>
	<input name="<portlet:namespace />position" type="text" value="<%=getParamValue(request,"position")  %>" class="middle" maxlength="100"/>
	<div class="right"></div>
</div></td>
</tr>
<!--<tr>
<td>Hasło*: </td><td><div class="input_row">
	<div class="left"></div> <input name="<portlet:namespace />password1"
		size="30" type="password" value="" class="middle" /><div class="right"></div></div>
		</td>
</tr>
<tr>
<td>Powtórz hasło*: </td><td> <div class="input_row">
	<div class="left"></div><input name="<portlet:namespace />password2"
		size="30" type="password" value="" class="middle"/><div class="right"></div></div></td>
</tr>
--></table>

<p class="nobottomgap"></p>
</div>
<div class="clear"></div>
</div>
<div class="bottom_left bottom_left_grey"></div>
<div class="bottom_right bottom_right_grey"></div>
</div>
</div>

<div id="right_col">
<div class="rounded_box">
<div class="top_left top_left_grey"></div>
<div class="top_right top_right_grey"></div>
<div class="inside_grey">
<div class="inside_content">

<div class="details_header details-margin">Dane instytucji:</div>
<div class="dots_h"></div>

<table>
<tr>
<td style="width:105px" >Nazwa*: </td><td>
<div class="input_row">
	<div class="left"></div>
	<input type="text" name="<portlet:namespace />company_name" value="<%=getParamValue(request,"company_name") %>" class="middle" maxlength="150"/>
	<div class="right"></div>
</div>
	</td>
</tr>
<tr>
<td>Adres*: </td><td>
<div class="input_row">
	<div class="left"></div>
	<input type="text" name="<portlet:namespace />company_address" value="<%=getParamValue(request,"company_address") %>" class="middle" maxlength="100"/>
	<div class="right"></div>
</div>
</td>
</tr>
<tr>
<td>Kod pocztowy*: </td><td>
<div class="input_row">
	<div class="left"></div>
	<input type="text" name="<portlet:namespace />company_postal_code" value="<%=getParamValue(request,"company_postal_code") %>" class="middle" maxlength="6"/>
	<div class="right"></div>
</div>
</td>
</tr>
<tr>
<td>Miasto*: </td><td>
<div class="input_row">
	<div class="left"></div>
	<input type="text" name="<portlet:namespace />company_city" value="<%=getParamValue(request,"company_city") %>" class="middle" maxlength="50"/>
	<div class="right"></div>
</div>
</td>
</tr>
<tr>
<td>Telefon*: </td><td><div class="input_row">
	<div class="left"></div>
	<input type="text" name="<portlet:namespace />company_phone" value="<%=getParamValue(request,"company_phone") %>" class="middle" maxlength="20"/>
	<div class="right"></div>
</div></td>
</tr>
<tr>
<td>Fax: </td><td><div class="input_row">
	<div class="left"></div>
	<input type="text" name="<portlet:namespace />company_fax" value="<%=getParamValue(request,"company_fax") %>" class="middle" maxlength="20"/>
	<div class="right"></div>
</div></td>
</tr>
<tr>
<td>Adres e-mail*: </td><td><div class="input_row">
	<div class="left"></div>
	<input type="text" name="<portlet:namespace />company_email" value="<%=getParamValue(request,"company_email")%>" class="middle" maxlength="60"/>
	<div class="right"></div>
</div></td>
</tr>
</table>

<p class="nobottomgap"></p>
</div>
<div class="clear"></div>
</div>
<div class="bottom_left bottom_left_grey"></div>
<div class="bottom_right bottom_right_grey"></div>
</div>
</div>
</div>
<div class="clear"></div>

<div class="rounded_box" style="margin-top:20px">
<div class="top_left top_left_grey"></div>
<div class="top_right top_right_grey"></div>
<div class="inside_grey">
<div class="inside_content">

<div class="details_header details-margin">Weryfikacja:</div>
<div class="dots_h"></div>
 <c:if test="<%= PropsValues.CAPTCHA_CHECK_PORTAL_CREATE_ACCOUNT %>">
	<portlet:actionURL
		windowState="<%= LiferayWindowState.EXCLUSIVE.toString() %>"
		var="captchaURL">
		<portlet:param name="struts_action" value="/login/captcha" />
	</portlet:actionURL>

	<liferay-ui:captcha url="<%= captchaURL %>" />
</c:if>

<div class="accept_rules"><input type="checkbox" name="accept_rules"/> Zapoznałem/am się i akceptuję regulamin oraz warunki korzystania z serwisu www.MamZdanie.org.pl.</div>

<p class="nobottomgap"></p>
</div>
<div class="clear"></div>
</div>
<div class="bottom_left bottom_left_grey"></div>
<div class="bottom_right bottom_right_grey"></div>
</div>

<div class="big_button green register_submit">	   
<div class="left"></div><div class="middle">
<a href="#" onclick="document.forms[1].submit(); return false">Zakładam konto!</a>
</div><div class="right"></div></div>
</div>
</form>

<!-- 
<%@ include file="/html/portlet/login/navigation.jspf"%>
 -->
<c:if test="<%= windowState.equals(WindowState.MAXIMIZED) %>">
	<script type="text/javascript">
		Liferay.Util.focusFormField(document.<portlet:namespace />fm.<portlet:namespace />firstName);
	</script>
</c:if>