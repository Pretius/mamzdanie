<%@page import="java.util.Calendar"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>
<%@page
	import="pl.mamzdanie.threaddetail.svc.service.ThreadDetailLocalServiceUtil"%>
<%@page import="pl.mamzdanie.threaddetail.svc.model.ThreadDetail"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="pl.mamzdanie.MZConstants"%>
<%@page import="pl.mamzdanie.CommonUtils"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@page import="javax.portlet.PortletURL"%>
<%@page import="javax.portlet.RenderResponse"%>

<%
	{
		boolean active = false;
		if (type.equals(MZConstants.active))
			active = true;
		String currentUrl = PortalUtil.getCurrentURL(request);
%>

<%
	if (type.equals(MZConstants.pending)) {
%>

<div class="dots_big_h big_h_subpage_margin"></div>
<div class="oczekujace"></div>
<h1 style="color: #AE4A4A;"><liferay-ui:message key="moderator.view.grid.pending.title" /></h1>
<%
	if (!withIterator) {
%>
<a class="see_more_link"
	href="<%=CommonUtils.manageUrl(currentUrl,
								"/konsultacje-oczekujace")%>">Zobacz
wszystkie</a>
<%
	}
		} else if (type.equals(MZConstants.active)) {
%>

<div class="dots_big_h big_h_subpage_margin"></div>
<div class="aktualnie_trwajace"></div>
<%
	if (!withIterator) {
%>
<a class="see_more_link"
	href="<%=CommonUtils.manageUrl(currentUrl,
								"/konsultacje-aktywne")%>">Zobacz
wszystkie</a>
<%
	}
		} else if (type.equals(MZConstants.last)) {
%>
<div class="dots_big_h_grey big_h_subpage_margin"></div>
<div class="ostatnio_zakonczone"></div>
<%
	if (!withIterator) {
%>
<a class="see_more_link"
	href="<%=CommonUtils.manageUrl(currentUrl,
								"/konsultacje-ostatnio-zakonczone")%>">Zobacz
wszystkie</a>
<%
	}
		} else if (type.equals(MZConstants.closed)) {
%>
<div class="dots_big_h_grey big_h_subpage_margin"></div>
<div class="zakonczone"></div>
<%
	if (!withIterator) {
%>
<a class="see_more_link"
	href="<%=CommonUtils.manageUrl(currentUrl,
								"/konsultacje-zakonczone")%>">Zobacz
wszystkie</a>
<%
	}
		}
%>

<%
	PortletURL portletURL = renderResponse.createRenderURL();
		SearchContainer searchContainer = null;

		//default values
		String orderByCol = "dateFrom";
		boolean asc = false;

		String orderByColS = ParamUtil.getString(renderRequest,
				"orderByCol");
		if (orderByColS != null && !orderByColS.equals("")) {
			orderByCol = orderByColS;
		}
		String orderByTypeS = ParamUtil.getString(renderRequest,
				"orderByType");
		if (orderByTypeS != null && !orderByTypeS.equals("")) {
			asc = orderByTypeS.equals("asc") ? true : false;
		}

		int delta = 10;

		searchContainer = new SearchContainer(renderRequest, null,
				null, SearchContainer.DEFAULT_CUR_PARAM, delta,
				portletURL, null, null);
		searchContainer.setOrderByCol(orderByCol);
		searchContainer.setOrderByType(asc ? "asc" : "desc");

		int total;
		List<ThreadDetail> threadDetails;

		if (type.equals(MZConstants.pending)) {
			threadDetails = ThreadDetailLocalServiceUtil
					.getPendingThreadDetails(
							searchContainer.getStart(),
							searchContainer.getEnd(), user);
			total = ThreadDetailLocalServiceUtil
					.getPendingThreadDetailsCount(user);
		} else if (type.equals(MZConstants.last)) {
			threadDetails = ThreadDetailLocalServiceUtil
					.getLastClosedThreadDetails(
							searchContainer.getStart(),
							searchContainer.getEnd(), user);
			total = ThreadDetailLocalServiceUtil
					.getLastClosedThreadDetailsCount(user);
		} else {
			threadDetails = ThreadDetailLocalServiceUtil
					.getThreadDetails(active,
							searchContainer.getStart(),
							searchContainer.getEnd(), orderByCol, asc,user,true);
			total = ThreadDetailLocalServiceUtil
					.getThreadDetailsCount(active,user);
		}

		searchContainer.setTotal(total);
		searchContainer.setResults(threadDetails);

		SimpleDateFormat format = new SimpleDateFormat("dd MMMM yyyy");

		String detailsURL = "/web/guest/konsultacje/-/message_boards/message/";
%>
<div class="common_container"><c:if
	test="<%= searchContainer.getTotal() > searchContainer.getDelta()  && withIterator%>">
	<div class="taglib-search-iterator-page-iterator-top"><liferay-ui:search-paginator
		searchContainer="<%= searchContainer %>" /></div>
</c:if>
<%
 	if (type.equals(MZConstants.pending)) {
 %>
<div class="red_header">Wszystkich oczekujące konsultacji: <%=total%></div>
<%
 	} else if (type.equals(MZConstants.active)) {
 %>
<div class="red_header">Wszystkich trwających konsultacji: <%=total%></div>
<%
	} else if (type.equals(MZConstants.last)) {
%>
<div class="grey_header">Zakończonych konsultacji: <%=total%></div>
<%
	} else if (type.equals(MZConstants.closed)) {
%>
<div class="grey_header">Zakończonych konsultacji: <%=total%></div>
<%
	}
%>

<table class="common_table">
	<tr class="header">
		<%
			if (withIterator) {
		%>
		<td style="width: 95px"><a
			href="<%=CommonUtils.generateOrderByUrl(renderResponse,
							"signature", orderByCol, asc)%>">Sygnatura</a></td>
		<td style="width: 280px"><a
			href="<%=CommonUtils.generateOrderByUrl(renderResponse,
							"subject", orderByCol, asc)%>">Przedmiot
		konsultacji:</a></td>
		<td style="width: 100px"><a
			href="<%=CommonUtils.generateOrderByUrl(renderResponse,
							"dateFrom", orderByCol, asc)%>">Data
		rozpoczęcia</a></td>
		<td style="width: 100px"><a
			href="<%=CommonUtils.generateOrderByUrl(renderResponse,
							"dateTo", orderByCol, asc)%>">Data
		zakończenia</a></td>
		<td><a
			href="<%=CommonUtils.generateOrderByUrl(renderResponse,
							"organizationName", orderByCol, asc)%>">Autor:</a></td>
		<%
			 if (!type.equals(MZConstants.pending)) {
		%>
		<td><a
			href="<%=CommonUtils.generateOrderByUrl(renderResponse,
							"quantity", orderByCol, asc)%>">Liczba
		wypowiedzi:</a></td>
		<%
			}
		%>
		<%
			 if (type.equals(MZConstants.active)) {
		%>
			<td class="last"><a
			href="<%=CommonUtils.generateOrderByUrl(renderResponse,
							"dateTo", orderByCol, asc)%>">Do zakończenia:</a></td>
		<%
			 } else if (type.equals(MZConstants.pending)) {
		%>
			<td class="last"><a
			href="<%=CommonUtils.generateOrderByUrl(renderResponse,
							"dateFrom", orderByCol, asc)%>">Do rozpoczęcia:</a></td>
		<% } else { %>
			<td class="last" style="color:#AC1818">Podsumowanie</td>
		<%} %>
		<%
			} else if (type.equals(MZConstants.active)) {
		%>
		<td style="width: 80px">Sygnatura</td>
		<td style="width: 220px">Przedmiot konsultacji:</td>
		<td style="width: 100px">Data rozpoczęcia</td>
		<td style="width: 100px">Data zakończenia</td>
		<td>Autor:</td>
		<td>Liczba wypowiedzi:</td>
		<td class="last">Do zakończenia:</td>
		<%
			} else if (type.equals(MZConstants.pending)) {
		%>
		<td style="width: 95px">Sygnatura</td>
		<td style="width: 280px">Przedmiot konsultacji:</td>
		<td style="width: 100px">Data rozpoczęcia</td>
		<td style="width: 100px">Data zakończenia</td>
		<td>Autor:</td>
		<td class="last">Do rozpoczęcia</td>
		<%
			} else {
		%>
		<td style="width: 95px">Sygnatura</td>
		<td style="width: 280px">Przedmiot konsultacji:</td>
		<td style="width: 100px">Data rozpoczęcia</td>
		<td style="width: 100px">Data zakończenia</td>
		<td>Autor:</td>
		<td>Liczba wypowiedzi:</td>
		<td class="last">Podsumowanie</td>
		<%
			}
		%>
	</tr>
	<%
		for (int i = 0; i < threadDetails.size(); i++) {
				ThreadDetail threadDetail = threadDetails.get(i);
				//if (!(threadDetail.getAccepted() || CommonUtils.isTechnicalAdmin(user)))
				//	continue;
				String time = "";
				Calendar cal1 = Calendar.getInstance();
				Calendar cal2 = Calendar.getInstance();
				
				if (type.equals(MZConstants.pending)) {
					cal1.setTime(threadDetail.getDateFrom());
				} else {
					cal1.setTime(threadDetail.getDateTo());
				}				
				
				long milis1 = cal1.getTimeInMillis();
				long milis2 = cal2.getTimeInMillis();
				long diff = milis1 - milis2;
				long diffMinutes = diff / (60 * 1000);
				long diffHours = diff / (60 * 60 * 1000);
				long diffDays = diff / (24 * 60 * 60 * 1000);
				if (diffDays != 0)
				{
					time = diffDays + (diffDays == 1 ? " dzień" : " dni");
				}
				else if (diffHours != 0)
					time = diffHours + " godz.";
				else
					time = diffMinutes + " min.";
				String subject = threadDetail.getSubject();
				if (!threadDetail.getAccepted())
					subject = "[ ? ] " + subject;
				
				/* Time warning for consultations which duration is between 7 - 21 days. */
				Calendar fromDate = Calendar.getInstance();
				Calendar toDate = Calendar.getInstance();
				
				fromDate.setTime(threadDetail.getDateFrom());
				toDate.setTime(threadDetail.getDateTo());
				
				long timeFrom = fromDate.getTimeInMillis();
				long timeTo = toDate.getTimeInMillis();
				
				long durationDiff = timeTo - timeFrom;
				long durationDiffDays = durationDiff / (24 * 60 * 60 * 1000);				
				
				boolean isDurationWarning = false;
				
				if (durationDiffDays >= 7 && durationDiffDays < 21) {
					isDurationWarning = true;
				} else {
					isDurationWarning = false;
				}
	%>
	<tr>
		<td><%=threadDetail.getSignature()%></td>
		<td><a href="<%=detailsURL + threadDetail.getRootMessageId()%>?_19_delta=100">
			<%=subject%>
		</a></td>
		<td><%=format.format(threadDetail.getDateFrom())%></td>
		<td><%=format.format(threadDetail.getDateTo())%></td>
		<td>
		<% 
		String userDetailsURL;
		userDetailsURL = "/web/guest/dane-uzytkownika?";
		userDetailsURL += "p_p_id=userdetails" + "&";
		userDetailsURL += "p_p_lifecycle=0" + "&";
		userDetailsURL += "p_p_state=normal" + "&";
		userDetailsURL += "p_p_mode=view" + "&";
		userDetailsURL += "p_p_col_id=column-1" + "&";
		userDetailsURL += "p_p_col_count=1"+ "&";
		userDetailsURL += "user_id="+threadDetail.getUserId();
		%>
		
		<a href="<%=userDetailsURL%>"><%=threadDetail.getOrganizationName()%></a>
		
		</td>
		<% 
			if (!type.equals(MZConstants.pending)) {
		%>
		<td style="text-align: center;"><%=threadDetail.getQuantity()%></td>
		<%
			}
		%>
		
		<%
			if (type.equals(MZConstants.active)) {
		%>
		<td>
			<c:choose>
				<c:when test="<%=isDurationWarning %>">
					<div>
						<div class="durationWarning" title="Czas trwania konsultacji jest krótszy niż standard serwisu MamZdanie.org.pl"><%=time%>&nbsp;</div>
					</div>
				</c:when>
				<c:otherwise>
					<div><%=time%></div>
				</c:otherwise>
			</c:choose>
		</td>
		<%
			} else if (type.equals(MZConstants.pending)) {
		%>
		<td><div><%=time%></div></td>
		<%
			} else {
		%>
			<td><%=CommonUtils.getSummary(threadDetail, detailsURL)%></td>
		<%
			}
		%>
	</tr>
	<%
		}
	%>
</table>
<c:if
	test="<%= searchContainer.getTotal() > searchContainer.getDelta() && withIterator%>">
	<div class="taglib-search-iterator-page-iterator-bottom"><liferay-ui:search-paginator
		searchContainer="<%= searchContainer %>" /></div>
</c:if></div>
<%
	}
%>
