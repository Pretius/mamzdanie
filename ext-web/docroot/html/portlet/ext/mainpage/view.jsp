<%@page contentType="text/html; charset=UTF-8"%>
<%@ include file="/html/portlet/ext/mainpage/init.jsp"%>

<%
	String addURL = CommonUtils.manageUrl(currentURL, "/konsultacje");
	addURL += "?p_p_id=19";
	addURL += "&p_p_lifecycle=0";
	addURL += "&p_p_state=normal";
	addURL += "&p_p_mode=view";
	addURL += "&p_p_col_id=column-1";
	addURL += "&p_p_col_count=1";
	addURL += "&_19_struts_action="+URLEncoder.encode("/message_boards/edit_message", "UTF-8");
	addURL += "&_19_redirect=" + URLEncoder.encode(currentURL);
	addURL += "&_19_categoryId=10178";
%>
<div class="dots_big_h main_dots_margin"></div>
<div class="czymjest"></div>
<div class="czymjest_content">
<div class="col_left">
MamZdanie.org.pl to pierwszy ogólnopolski serwis dedykowany  otwartym konsultacjom społecznym.   Powstał w odpowiedzi na potrzebę większej przejrzystości tworzenia aktów prawa i innych dokumentów określających polityki publiczne (zarówno na poziomie krajowym jak i lokalnym).  Ogólną zasadą jego funkcjonowania jest powszechna dostępność projektów dokumentów,  określenie czasu w jakim są one przedmiotem konsultacji oraz możliwość wyrażania opinii na temat dokumentów (po uprzednim zarejestrowaniu się w serwisie).  Dzięki serwisowi wszystkie tak wyrażone opinie są dostępne nie tylko dla instytucji, konsultującej dokument, ale dla wszystkich zainteresowanych - odwiedzających  serwis.
</div>
<div class="col_right">
<div class="big_button_grey">
<div class="left"></div>
<div class="middle"><a href="<%=CommonUtils.manageUrl(themeDisplay.getURLPortal(),"/strona-glowna?p_p_id=58&p_p_lifecycle=1&p_p_state=maximized&p_p_mode=view&saveLastPath=0&_58_struts_action=%2Flogin%2Fcreate_account")%>">Zarejestruj konto jako osoba
lub instytucja.</a>
<div class="down_arrow"></div>
</div>
<div class="right"></div>
</div>
<div class="big_button_grey">
<div class="left"></div>
<div class="middle"><a href="<%= (CommonUtils.isEmiter(user) || CommonUtils.isTechnicalAdmin(user)) ?addURL:CommonUtils.manageUrl(currentURL, "/konsultacje-aktywne")%>">Załóż nową lub
dołącz do trwającej konsultacji.</a>
<div class="down_arrow"></div>
</div>
<div class="right"></div>
</div>
<div class="big_button_grey">
<div class="left"></div>
<div class="middle"><a href="<%=CommonUtils.manageUrl(currentURL, "/konsultacje-aktywne")%>">Miej wpływ na życie publiczne
w Polsce!</a></div>
<div class="right"></div>
</div>
</div>
</div>

<c:if test="<%=CommonUtils.isEmiter(user) || CommonUtils.isTechnicalAdmin(user)%>">	
	<%@ include file="/html/portlet/ext/moderator/rejectGrid.jsp"%>
	<div class="margin_between"></div>
	<%@ include file="/html/portlet/ext/moderator/inactiveGrid.jsp"%>
	<div class="margin_between"></div>
</c:if>
<%
	String type = MZConstants.pending;
	boolean withIterator = false;
%>
<c:if test="<%=CommonUtils.isEmiter(user) || CommonUtils.isTechnicalAdmin(user)%>">
	<%@ include file="/html/portlet/ext/commongrid/grid.jsp"%>
	<div class="margin_between"></div>
</c:if>

<%
	type = MZConstants.active;
%>
<%@ include file="/html/portlet/ext/commongrid/grid.jsp"%>
<div class="margin_between"></div>
<%
	type = MZConstants.last;
%>
<%@ include file="/html/portlet/ext/commongrid/grid.jsp"%>
<div class="margin_between"></div>
<%
	type = MZConstants.closed;
%>
<%@ include file="/html/portlet/ext/commongrid/grid.jsp"%>
